@interface HKRPOnboardingSettingsViewController
- (BOOL)didLayoutSubviews;
- (BOOL)isInitialInsetsSet;
- (BOOL)isVisible;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (HKRPOnboardingDelegate)onboardingDelegate;
- (HKRPOnboardingSettingsViewController)initWithStyle:(int64_t)a3 settings:(id)a4 onboardingManager:(id)a5 onboardingDelegate:(id)a6;
- (HKRPOxygenSaturationOnboardingManager)onboardingManager;
- (HKRPOxygenSaturationSettings)settings;
- (OBBoldTrayButton)suggestedChoiceButton;
- (OBLinkTrayButton)setupLaterButton;
- (RespiratoryHealthHeroView)watchView;
- (UIEdgeInsets)initialInsets;
- (UILabel)descriptionLabel;
- (UILabel)locationLabel;
- (UILabel)titleLabel;
- (UIScrollView)scrollView;
- (UIView)contentView;
- (UIView)footerView;
- (UIVisualEffectView)blurView;
- (double)_calculateHeroHorizontalMarginForViewFrame:(CGRect)a3;
- (id)_headerTitleFont;
- (id)_localizedStringForKey:(id)a3;
- (id)backgroundColor;
- (id)labelColor;
- (id)pillBackgroundColor;
- (id)pillBackgroundSelectedColor;
- (id)pillTitleColor;
- (id)pillTitleSelectedColor;
- (int64_t)style;
- (void)_askUserToInstallWatchAppWithCompletion:(id)a3;
- (void)_installWatchAppIfNeededWithCompletion:(id)a3;
- (void)_onboardWithCompletion:(id)a3;
- (void)_presentOnboardingError:(id)a3 completion:(id)a4;
- (void)createUI;
- (void)layoutUI;
- (void)registerForTraitChanges;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDidLayoutSubviews:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setInitialInsets:(UIEdgeInsets)a3;
- (void)setInsetsIfNeeded;
- (void)setIsInitialInsetsSet:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setLocationLabel:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)setOnboardingDelegate:(id)a3;
- (void)setOnboardingManager:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSetupLaterButton:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSuggestedChoiceButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWatchView:(id)a3;
- (void)setupLaterButtonPressed:(id)a3;
- (void)suggestedChoiceButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation HKRPOnboardingSettingsViewController

- (HKRPOnboardingSettingsViewController)initWithStyle:(int64_t)a3 settings:(id)a4 onboardingManager:(id)a5 onboardingDelegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKRPOnboardingSettingsViewController;
  v14 = [(HKRPOnboardingSettingsViewController *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_style = a3;
    objc_storeStrong((id *)&v14->_settings, a4);
    objc_storeStrong((id *)&v15->_onboardingManager, a5);
    objc_storeWeak((id *)&v15->_onboardingDelegate, v13);
    v15->_didLayoutSubviews = 0;
  }

  return v15;
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[(HKRPOnboardingSettingsViewController *)self registerForTraitChanges:v3 withHandler:&__block_literal_global];
}

uint64_t __63__HKRPOnboardingSettingsViewController_registerForTraitChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 layoutUI];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKRPOnboardingSettingsViewController;
  [(HKRPOnboardingSettingsViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(HKRPOnboardingSettingsViewController *)self layoutUI];
}

- (void)setInsetsIfNeeded
{
  if (![(HKRPOnboardingSettingsViewController *)self isInitialInsetsSet]
    || [(HKRPOnboardingSettingsViewController *)self style] != 1)
  {
    [(HKRPOnboardingSettingsViewController *)self setIsInitialInsetsSet:1];
    id v3 = [(HKRPOnboardingSettingsViewController *)self view];
    [v3 safeAreaInsets];
    -[HKRPOnboardingSettingsViewController setInitialInsets:](self, "setInitialInsets:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKRPOnboardingSettingsViewController;
  [(HKRPOnboardingSettingsViewController *)&v4 viewDidAppear:a3];
  [(HKRPOnboardingSettingsViewController *)self setIsVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKRPOnboardingSettingsViewController;
  [(HKRPOnboardingSettingsViewController *)&v4 viewDidDisappear:a3];
  [(HKRPOnboardingSettingsViewController *)self setIsVisible:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKRPOnboardingSettingsViewController;
  [(HKRPOnboardingSettingsViewController *)&v3 viewDidLoad];
  [(HKRPOnboardingSettingsViewController *)self registerForTraitChanges];
}

- (void)createUI
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  [(HKRPOnboardingSettingsViewController *)self setInsetsIfNeeded];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  objc_super v3 = [(HKRPOnboardingSettingsViewController *)self view];
  objc_super v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v97 objects:v101 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v98;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v98 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v97 + 1) + 8 * v8++) removeFromSuperview];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v97 objects:v101 count:16];
    }
    while (v6);
  }

  v9 = [(HKRPOnboardingSettingsViewController *)self backgroundColor];
  v10 = [(HKRPOnboardingSettingsViewController *)self view];
  [v10 setBackgroundColor:v9];

  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C940]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(HKRPOnboardingSettingsViewController *)self setScrollView:v11];

  id v12 = [(HKRPOnboardingSettingsViewController *)self scrollView];
  [v12 setShowsVerticalScrollIndicator:0];

  id v13 = [(HKRPOnboardingSettingsViewController *)self scrollView];
  [v13 setAlwaysBounceVertical:1];

  v14 = [(HKRPOnboardingSettingsViewController *)self scrollView];
  [v14 setDelegate:self];

  v15 = [(HKRPOnboardingSettingsViewController *)self view];
  v16 = [(HKRPOnboardingSettingsViewController *)self scrollView];
  [v15 addSubview:v16];

  objc_super v17 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(HKRPOnboardingSettingsViewController *)self setContentView:v17];

  v18 = [(HKRPOnboardingSettingsViewController *)self scrollView];
  v19 = [(HKRPOnboardingSettingsViewController *)self contentView];
  [v18 addSubview:v19];

  v20 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(HKRPOnboardingSettingsViewController *)self setTitleLabel:v20];

  v21 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_TITLE"];
  v22 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
  [v22 setText:v21];

  v23 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
  [v23 setTextAlignment:1];

  v24 = [(HKRPOnboardingSettingsViewController *)self _headerTitleFont];
  v25 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
  [v25 setFont:v24];

  v26 = [(HKRPOnboardingSettingsViewController *)self labelColor];
  v27 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
  [v27 setTextColor:v26];

  v28 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
  [v28 setNumberOfLines:0];

  v29 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
  [v29 setAdjustsFontForContentSizeCategory:1];

  v30 = [(HKRPOnboardingSettingsViewController *)self contentView];
  v31 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
  [v30 addSubview:v31];

  v32 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(HKRPOnboardingSettingsViewController *)self setDescriptionLabel:v32];

  v33 = [(HKRPOnboardingSettingsViewController *)self settings];
  v34 = [v33 recordingInactiveDescription];
  v35 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
  [v35 setText:v34];

  v36 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
  [v36 setTextAlignment:1];

  v37 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
  v38 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
  [v38 setFont:v37];

  v39 = [(HKRPOnboardingSettingsViewController *)self labelColor];
  v40 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
  [v40 setTextColor:v39];

  v41 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
  [v41 setNumberOfLines:0];

  v42 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
  [v42 setAdjustsFontForContentSizeCategory:1];

  v43 = [(HKRPOnboardingSettingsViewController *)self contentView];
  v44 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
  [v43 addSubview:v44];

  v45 = objc_alloc_init(RespiratoryHealthHeroView);
  [(HKRPOnboardingSettingsViewController *)self setWatchView:v45];

  v46 = [(HKRPOnboardingSettingsViewController *)self view];
  [v46 frame];
  double v48 = v47;
  v49 = [(HKRPOnboardingSettingsViewController *)self view];
  [v49 frame];
  -[HKRPOnboardingSettingsViewController _calculateHeroHorizontalMarginForViewFrame:](self, "_calculateHeroHorizontalMarginForViewFrame:");
  double v51 = v48 + v50 * -2.0;
  v52 = [(HKRPOnboardingSettingsViewController *)self watchView];
  [v52 setPreferredWidth:v51];

  v53 = [(HKRPOnboardingSettingsViewController *)self contentView];
  v54 = [(HKRPOnboardingSettingsViewController *)self watchView];
  [v53 addSubview:v54];

  v55 = [MEMORY[0x263F5B8D0] linkButton];
  [(HKRPOnboardingSettingsViewController *)self setSetupLaterButton:v55];

  v56 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
  [v56 setTranslatesAutoresizingMaskIntoConstraints:1];

  v57 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
  v58 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_SET_UP_LATER"];
  [v57 setTitle:v58 forState:0];

  v59 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
  [v59 addTarget:self action:sel_setupLaterButtonPressed_ forControlEvents:64];

  v60 = [(HKRPOnboardingSettingsViewController *)self contentView];
  v61 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
  [v60 addSubview:v61];

  v62 = [MEMORY[0x263F5B898] boldButton];
  [(HKRPOnboardingSettingsViewController *)self setSuggestedChoiceButton:v62];

  v63 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
  [v63 setTranslatesAutoresizingMaskIntoConstraints:1];

  v64 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
  v65 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_ENABLE"];
  [v64 setTitle:v65 forState:0];

  v66 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
  [v66 addTarget:self action:sel_suggestedChoiceButtonPressed_ forControlEvents:64];

  v67 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
  v68 = [(HKRPOnboardingSettingsViewController *)self pillBackgroundColor];
  [v67 setTintColor:v68];

  v69 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
  v70 = [(HKRPOnboardingSettingsViewController *)self pillBackgroundSelectedColor];
  v71 = BPSPillButtonBackground();
  [v69 setBackgroundImage:v71 forState:4];

  v72 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
  v73 = [(HKRPOnboardingSettingsViewController *)self pillTitleColor];
  [v72 setTitleColor:v73 forState:2];

  v74 = [(HKRPOnboardingSettingsViewController *)self contentView];
  v75 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
  [v74 addSubview:v75];

  v76 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(HKRPOnboardingSettingsViewController *)self setLocationLabel:v76];

  v77 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_BUTTON_CAPTION"];
  v78 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
  [v78 setText:v77];

  v79 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
  [v79 setTextAlignment:1];

  v80 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
  [v80 setNumberOfLines:0];

  v81 = [MEMORY[0x263F1C550] systemGrayColor];
  v82 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
  [v82 setTextColor:v81];

  v83 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D278]];
  v84 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
  [v84 setFont:v83];

  v85 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
  [v85 setAdjustsFontForContentSizeCategory:1];

  v86 = [(HKRPOnboardingSettingsViewController *)self contentView];
  v87 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
  [v86 addSubview:v87];

  v88 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(HKRPOnboardingSettingsViewController *)self setFooterView:v88];

  v89 = [MEMORY[0x263F1C480] effectWithStyle:5];
  v90 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v89];
  [(HKRPOnboardingSettingsViewController *)self setBlurView:v90];

  v91 = [(HKRPOnboardingSettingsViewController *)self blurView];
  objc_msgSend(v91, "setFrame:", 0.0, 0.0, 1.0, 1.0);

  v92 = [(HKRPOnboardingSettingsViewController *)self footerView];
  v93 = [(HKRPOnboardingSettingsViewController *)self blurView];
  [v92 addSubview:v93];

  v94 = [(HKRPOnboardingSettingsViewController *)self footerView];
  [v94 setHidden:1];

  v95 = [(HKRPOnboardingSettingsViewController *)self view];
  v96 = [(HKRPOnboardingSettingsViewController *)self footerView];
  [v95 addSubview:v96];
}

- (void)layoutUI
{
  if ([(HKRPOnboardingSettingsViewController *)self style] != 1
    || ![(HKRPOnboardingSettingsViewController *)self didLayoutSubviews]
    || [(HKRPOnboardingSettingsViewController *)self isVisible])
  {
    [(HKRPOnboardingSettingsViewController *)self setDidLayoutSubviews:1];
    [(HKRPOnboardingSettingsViewController *)self createUI];
    [(HKRPOnboardingSettingsViewController *)self initialInsets];
    double v159 = v4;
    id v160 = v3;
    double v6 = v5;
    double v8 = v7;
    v9 = [(HKRPOnboardingSettingsViewController *)self view];
    [v9 frame];
    double v11 = v10 - v6 - v8 + -48.0;

    id v12 = [(HKRPOnboardingSettingsViewController *)self view];
    [v12 frame];
    double v14 = v13;

    v15 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
    objc_msgSend(v15, "sizeThatFits:", v11, v14);
    double v17 = v16;

    double v18 = v6 + 24.0;
    v19 = [(HKRPOnboardingSettingsViewController *)self titleLabel];
    objc_msgSend(v19, "setFrame:", v6 + 24.0, 30.0, v11, v17);

    double v20 = v17 + 30.0 + 16.0;
    v21 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
    objc_msgSend(v21, "sizeThatFits:", v11, v14);
    double v23 = v22;

    v24 = [(HKRPOnboardingSettingsViewController *)self descriptionLabel];
    objc_msgSend(v24, "setFrame:", v6 + 24.0, v20, v11, v23);

    double v25 = v20 + v23 + 24.0;
    v26 = [(HKRPOnboardingSettingsViewController *)self watchView];
    objc_msgSend(v26, "sizeThatFits:", v11, v14);
    double v28 = v27;
    double v30 = v29;

    v31 = [(HKRPOnboardingSettingsViewController *)self watchView];
    objc_msgSend(v31, "setFrame:", v6 + (v11 - v28) * 0.5 + 24.0, v25, v28, v30);

    double v32 = v25 + v30;
    int64_t v33 = [(HKRPOnboardingSettingsViewController *)self style];
    double v34 = 49.0;
    if (v33 != 1) {
      double v34 = 0.0;
    }
    double v35 = *(double *)&v160 + v159 - v34;
    v36 = [(HKRPOnboardingSettingsViewController *)self view];
    [v36 frame];
    double v38 = v37 - v35;

    double v39 = v38 + -16.0;
    v40 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
    objc_msgSend(v40, "sizeThatFits:", v11, v14);
    double v42 = v41;

    double v43 = v39 - v42;
    v44 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
    objc_msgSend(v44, "setFrame:", v18, v43, v11, v42);

    v45 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
    objc_msgSend(v45, "sizeThatFits:", v11, v14);
    double v47 = v46;

    double v48 = v43 + -4.0 - v47;
    v49 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
    objc_msgSend(v49, "setFrame:", v18, v48, v11, v47);

    double v50 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
    objc_msgSend(v50, "sizeThatFits:", v11, v14);
    double v52 = v51;

    double v53 = v48 + -20.0 - v52;
    v54 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
    objc_msgSend(v54, "setFrame:", v18, v53, v11, v52);

    double v55 = v32;
    double v56 = v53 - v32;
    double v57 = v53 + -16.0;
    double v58 = v35 + v53;
    double v59 = v35;
    double v60 = v58 + -16.0;
    double v61 = v57;
    v62 = [(HKRPOnboardingSettingsViewController *)self view];
    [v62 frame];
    double v64 = v63;
    v65 = [(HKRPOnboardingSettingsViewController *)self footerView];
    objc_msgSend(v65, "setFrame:", 0.0, v60, v64, v14 - v61);

    v66 = [(HKRPOnboardingSettingsViewController *)self footerView];
    [v66 frame];
    double v68 = v67;
    v69 = [(HKRPOnboardingSettingsViewController *)self footerView];
    [v69 frame];
    double v71 = v70;
    v72 = [(HKRPOnboardingSettingsViewController *)self blurView];
    objc_msgSend(v72, "setFrame:", 0.0, 0.0, v68, v71);

    v73 = [(HKRPOnboardingSettingsViewController *)self view];
    [v73 frame];
    double v75 = v74;
    v76 = [(HKRPOnboardingSettingsViewController *)self contentView];
    objc_msgSend(v76, "setFrame:", 0.0, 0.0, v75, v55);

    v77 = [(HKRPOnboardingSettingsViewController *)self view];
    [v77 frame];
    double v79 = v78;
    v80 = [(HKRPOnboardingSettingsViewController *)self view];
    [v80 frame];
    double v82 = v81;
    v83 = [(HKRPOnboardingSettingsViewController *)self scrollView];
    objc_msgSend(v83, "setFrame:", 0.0, 0.0, v79, v82);

    v84 = [(HKRPOnboardingSettingsViewController *)self scrollView];
    [v84 setScrollEnabled:v56 < 14.0];

    if (v56 >= 14.0)
    {
      v135 = [(HKRPOnboardingSettingsViewController *)self contentView];
      v136 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
      [v135 addSubview:v136];

      v137 = [(HKRPOnboardingSettingsViewController *)self contentView];
      v138 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
      [v137 addSubview:v138];

      v139 = [(HKRPOnboardingSettingsViewController *)self contentView];
      v140 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
      [v139 addSubview:v140];

      v141 = [(HKRPOnboardingSettingsViewController *)self scrollView];
      objc_msgSend(v141, "setContentInset:", *(double *)&v160, 0.0, 0.0, 0.0);

      v142 = [(HKRPOnboardingSettingsViewController *)self contentView];
      [v142 frame];
      double v144 = v143;
      double v146 = v145;
      double v148 = v147;

      v149 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
      [v149 frame];
      double v151 = v150;
      v152 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
      [v152 bounds];
      double v154 = v151 + v153;

      v155 = [(HKRPOnboardingSettingsViewController *)self contentView];
      objc_msgSend(v155, "setFrame:", v144, v146, v148, v154);

      v134 = [(HKRPOnboardingSettingsViewController *)self footerView];
      [v134 setHidden:1];
    }
    else
    {
      v85 = [(HKRPOnboardingSettingsViewController *)self footerView];
      v86 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
      [v85 addSubview:v86];

      v87 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
      [v87 frame];
      double v89 = v88;
      double v91 = v90;
      double v93 = v92;
      double v95 = v94;

      v96 = [(HKRPOnboardingSettingsViewController *)self setupLaterButton];
      objc_msgSend(v96, "setFrame:", v89, v91 - v61, v93, v95);

      long long v97 = [(HKRPOnboardingSettingsViewController *)self footerView];
      long long v98 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
      [v97 addSubview:v98];

      long long v99 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
      [v99 frame];
      double v101 = v100;
      double v103 = v102;
      double v105 = v104;
      double v107 = v106;

      v108 = [(HKRPOnboardingSettingsViewController *)self suggestedChoiceButton];
      objc_msgSend(v108, "setFrame:", v101, v103 - v61, v105, v107);

      v109 = [(HKRPOnboardingSettingsViewController *)self footerView];
      v110 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
      [v109 addSubview:v110];

      v111 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
      [v111 frame];
      double v113 = v112;
      double v115 = v114;
      double v117 = v116;
      double v119 = v118;

      v120 = [(HKRPOnboardingSettingsViewController *)self locationLabel];
      objc_msgSend(v120, "setFrame:", v113, v115 - v61, v117, v119);

      v121 = [(HKRPOnboardingSettingsViewController *)self footerView];
      [v121 setHidden:0];

      v122 = [(HKRPOnboardingSettingsViewController *)self contentView];
      [v122 frame];
      double v124 = v123;
      double v126 = v125;
      double v128 = v127;
      double v130 = v129;

      v131 = [(HKRPOnboardingSettingsViewController *)self footerView];
      [v131 frame];
      double v133 = v130 + v132 - v59;

      v134 = [(HKRPOnboardingSettingsViewController *)self contentView];
      objc_msgSend(v134, "setFrame:", v124, v126, v128, v133);
    }

    id v161 = [(HKRPOnboardingSettingsViewController *)self scrollView];
    v156 = [(HKRPOnboardingSettingsViewController *)self contentView];
    [v156 frame];
    objc_msgSend(v161, "setContentSize:", v157, v158);
  }
}

- (void)suggestedChoiceButtonPressed:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke;
  v3[3] = &unk_264C4DAD8;
  v3[4] = self;
  [(HKRPOnboardingSettingsViewController *)self _onboardWithCompletion:v3];
}

void __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke_2;
  v2[3] = &unk_264C4DAB0;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) onboardingDelegate];
  [v2 enablePressedWithAppropriateRegion:*(unsigned __int8 *)(a1 + 40)];
}

- (double)_calculateHeroHorizontalMarginForViewFrame:(CGRect)a3
{
  return a3.size.width / 375.0 * 115.0;
}

- (void)_onboardWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(HKRPOnboardingSettingsViewController *)self onboardingManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke;
  v7[3] = &unk_264C4DC10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 onboardWithCompletion:v7];
}

void __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_2;
    v12[3] = &unk_264C4DB00;
    double v7 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    [v7 _installWatchAppIfNeededWithCompletion:v12];
    id v8 = v13;
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_3;
    v9[3] = &unk_264C4DB28;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v9);

    id v8 = v10;
  }
}

uint64_t __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_4;
  v3[3] = &unk_264C4DB00;
  id v4 = *(id *)(a1 + 48);
  [v1 _presentOnboardingError:v2 completion:v3];
}

uint64_t __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_installWatchAppIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HKRPWatchAppInstaller);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke;
  v8[3] = &unk_264C4DCB0;
  v9 = v5;
  id v10 = v4;
  v8[4] = self;
  id v6 = v5;
  id v7 = v4;
  [(HKRPWatchAppInstaller *)v6 checkIfAppCanBeInstalledWithCompletion:v8];
}

void __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_2;
    block[3] = &unk_264C4DC88;
    block[4] = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    char v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

void __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_3;
  v3[3] = &unk_264C4DC60;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _askUserToInstallWatchAppWithCompletion:v3];
}

void __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_4;
    v4[3] = &unk_264C4DC38;
    uint64_t v2 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v2 installAppWithCompletion:v4];
  }
  else
  {
    char v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

uint64_t __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_askUserToInstallWatchAppWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F1C3F8];
  id v6 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_TITLE"];
  id v7 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_BODY"];
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  v9 = (void *)MEMORY[0x263F1C3F0];
  id v10 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_CANCEL_BUTTON_TITLE"];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke;
  v22[3] = &unk_264C4DB78;
  id v11 = v4;
  id v23 = v11;
  id v12 = [v9 actionWithTitle:v10 style:1 handler:v22];

  id v13 = (void *)MEMORY[0x263F1C3F0];
  double v14 = [(HKRPOnboardingSettingsViewController *)self _localizedStringForKey:@"RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_INSTALL_BUTTON_TITLE"];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke_2;
  double v20 = &unk_264C4DB78;
  id v21 = v11;
  id v15 = v11;
  double v16 = [v13 actionWithTitle:v14 style:0 handler:&v17];

  objc_msgSend(v8, "addAction:", v12, v17, v18, v19, v20);
  [v8 addAction:v16];
  [(HKRPOnboardingSettingsViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentOnboardingError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  id v10 = [v8 domain];
  uint64_t v11 = *MEMORY[0x263F09548];
  if (([v10 isEqualToString:*MEMORY[0x263F09548]] & 1) == 0)
  {

LABEL_5:
    id v17 = v8;
    uint64_t v18 = [v17 domain];
    if ([v18 isEqualToString:v11])
    {
      uint64_t v19 = [v17 code];

      if (v19 == 110)
      {
        double v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v15 = v20;
        id v21 = @"RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_UNAPPROVED_ERROR";
LABEL_10:
        double v16 = [v20 localizedStringForKey:v21 value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];
        double v14 = 0;
        goto LABEL_11;
      }
    }
    else
    {
    }
    double v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = v20;
    id v21 = @"RESPIRATORY_HEALTH_ONBOARDING_ALERT_COMPLETION_UNKNOWN_ERROR";
    goto LABEL_10;
  }
  uint64_t v12 = [v8 code];

  if (v12 != 109) {
    goto LABEL_5;
  }
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v14 = [v13 localizedStringForKey:@"RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_TITLE" value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];

  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v16 = [v15 localizedStringForKey:@"RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_BODY" value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];
LABEL_11:

  double v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v23 = [v22 localizedStringForKey:@"OK" value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];

  v24 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v14 message:v16 preferredStyle:1];
  double v25 = (void *)MEMORY[0x263F1C3F0];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __alertControllerForOnboardingError_block_invoke_0;
  v28[3] = &unk_264C4DB78;
  id v29 = v9;
  id v26 = v9;
  double v27 = [v25 actionWithTitle:v23 style:0 handler:v28];
  [v24 addAction:v27];

  [(HKRPOnboardingSettingsViewController *)self presentViewController:v24 animated:1 completion:0];
}

- (void)setupLaterButtonPressed:(id)a3
{
  id v3 = [(HKRPOnboardingSettingsViewController *)self onboardingDelegate];
  [v3 setupLaterPressed];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  id v4 = [(HKRPOnboardingSettingsViewController *)self onboardingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HKRPOnboardingSettingsViewController *)self onboardingDelegate];
    [v6 onboardingScrollViewDidScroll:v7];
  }
}

- (id)_headerTitleFont
{
  uint64_t v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2B0]];
  id v3 = [v2 fontDescriptor];
  id v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  char v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)backgroundColor
{
  int64_t style = self->_style;
  if (style == 1)
  {
    id v3 = [MEMORY[0x263F1C550] systemBlackColor];
  }
  else if (style == 2)
  {
    id v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)labelColor
{
  int64_t style = self->_style;
  if (style == 1)
  {
    id v3 = [MEMORY[0x263F1C550] systemWhiteColor];
  }
  else if (style == 2)
  {
    id v3 = [MEMORY[0x263F1C550] labelColor];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)pillBackgroundSelectedColor
{
  int64_t style = self->_style;
  if (style == 1)
  {
    id v4 = BPSPillSelectedColor();
  }
  else if (style == 2)
  {
    id v3 = [(HKRPOnboardingSettingsViewController *)self pillBackgroundColor];
    id v4 = [v3 colorWithAlphaComponent:0.25];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)pillBackgroundColor
{
  int64_t style = self->_style;
  if (style == 1)
  {
    id v3 = BPSPillDeselectedColor();
  }
  else if (style == 2)
  {
    id v3 = [MEMORY[0x263F1C550] systemBlueColor];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)pillTitleColor
{
  int64_t style = self->_style;
  if (style == 1)
  {
    id v3 = [MEMORY[0x263F1C550] colorWithWhite:0.7 alpha:1.0];
  }
  else if (style == 2)
  {
    id v3 = [MEMORY[0x263F1C550] systemWhiteColor];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)pillTitleSelectedColor
{
  int64_t style = self->_style;
  if (style == 1)
  {
    id v4 = [MEMORY[0x263F1C550] colorWithWhite:0.7 alpha:1.0];
  }
  else if (style == 2)
  {
    id v3 = [(HKRPOnboardingSettingsViewController *)self pillTitleColor];
    id v4 = [v3 colorWithAlphaComponent:0.25];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_localizedStringForKey:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  char v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v4 value:&stru_26E87DBF8 table:@"RespiratoryHealthUI"];

  return v6;
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);
  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (HKRPOxygenSaturationSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (HKRPOxygenSaturationOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
}

- (HKRPOnboardingDelegate)onboardingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingDelegate);
  return (HKRPOnboardingDelegate *)WeakRetained;
}

- (void)setOnboardingDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (RespiratoryHealthHeroView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
}

- (OBBoldTrayButton)suggestedChoiceButton
{
  return self->_suggestedChoiceButton;
}

- (void)setSuggestedChoiceButton:(id)a3
{
}

- (OBLinkTrayButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (void)setSetupLaterButton:(id)a3
{
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (BOOL)didLayoutSubviews
{
  return self->_didLayoutSubviews;
}

- (void)setDidLayoutSubviews:(BOOL)a3
{
  self->_didLayoutSubviews = a3;
}

- (UIEdgeInsets)initialInsets
{
  double top = self->_initialInsets.top;
  double left = self->_initialInsets.left;
  double bottom = self->_initialInsets.bottom;
  double right = self->_initialInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInitialInsets:(UIEdgeInsets)a3
{
  self->_initialInsets = a3;
}

- (BOOL)isInitialInsetsSet
{
  return self->_isInitialInsetsSet;
}

- (void)setIsInitialInsetsSet:(BOOL)a3
{
  self->_isInitialInsetsSet = a3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_suggestedChoiceButton, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->miniFlowDelegate);
}

@end