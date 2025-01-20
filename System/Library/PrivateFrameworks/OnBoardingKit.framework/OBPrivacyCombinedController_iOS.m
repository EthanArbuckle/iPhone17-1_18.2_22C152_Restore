@interface OBPrivacyCombinedController_iOS
- (BOOL)_canShowWhileLocked;
- (BOOL)isUnifiedAbout;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)bundles;
- (NSArray)privacyFlowGroups;
- (NSArray)privacyFlows;
- (OBHeaderAccessoryButton)linkToPrivacyGatewayButton;
- (OBPrivacyCombinedController_iOS)initWithBundles:(id)a3;
- (OBPrivacyFlow)initialPrivacyFlow;
- (UIImage)headerIcon;
- (id)_privacyFlowForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_languageToggleTapped;
- (void)_loadViewsWithContentFromBundles;
- (void)setBundles:(id)a3;
- (void)setCustomTintColor:(id)a3;
- (void)setHeaderIcon:(id)a3;
- (void)setInitialPrivacyFlow:(id)a3;
- (void)setIsUnifiedAbout:(BOOL)a3;
- (void)setLinkToPrivacyGatewayButton:(id)a3;
- (void)setPrivacyFlowGroups:(id)a3;
- (void)setPrivacyFlows:(id)a3;
- (void)showPrivacyGateway:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OBPrivacyCombinedController_iOS

- (OBPrivacyCombinedController_iOS)initWithBundles:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBPrivacyCombinedController_iOS;
  v5 = [(OBPrivacyCombinedController *)&v9 initWithBundles:v4];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundles = v5->_bundles;
    v5->_bundles = (NSArray *)v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)OBPrivacyCombinedController_iOS;
  [(OBTableWelcomeController *)&v53 viewDidLoad];
  v3 = [(OBPrivacyCombinedController *)self additionalDisplayLanguageManager];

  if (!v3)
  {
    id v4 = [OBAdditionalDisplayLanguageManager alloc];
    v5 = [(OBPrivacyCombinedController *)self displayLanguage];
    uint64_t v6 = [(OBAdditionalDisplayLanguageManager *)v4 initWithDisplayLanguage:v5];
    [(OBPrivacyCombinedController *)self setAdditionalDisplayLanguageManager:v6];
  }
  [(OBWelcomeController *)self setTemplateType:1];
  v7 = [(OBBaseWelcomeController *)self navigationItem];
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v9 = [(OBPrivacyCombinedController *)self displayLanguage];
  v10 = +[OBUtilities localizedString:@"COMBINED_SPLASH_TITLE" forTable:@"Localizable" inBundle:v8 forLanguage:v9];
  [v7 setBackButtonTitle:v10];

  v11 = [(OBPrivacyCombinedController_iOS *)self bundles];
  -[OBPrivacyCombinedController_iOS setIsUnifiedAbout:](self, "setIsUnifiedAbout:", [v11 count] == 0);

  BOOL v12 = [(OBPrivacyCombinedController *)self underlineLinks];
  v13 = [(OBWelcomeController *)self headerView];
  [v13 setUnderlineLinks:v12];

  v14 = [(OBPrivacyCombinedController_iOS *)self bundles];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    v16 = (void *)MEMORY[0x1E4F1CA48];
    v17 = +[OBBundleManager sharedManager];
    v18 = [v17 orderedPrivacyBundlesWithInclusionOptions:9];
    v19 = [v16 arrayWithArray:v18];

    if ([(OBPrivacyCombinedController *)self presentedFromPrivacyPane]) {
      v20 = @"com.apple.onboarding.privacypanemini";
    }
    else {
      v20 = @"com.apple.onboarding.privacypane";
    }
    v21 = +[OBBundle bundleWithIdentifier:v20];
    [v19 insertObject:v21 atIndex:0];
    [(OBPrivacyCombinedController_iOS *)self setBundles:v19];
  }
  [(OBPrivacyCombinedController_iOS *)self setInitialPrivacyFlow:0];
  [(OBPrivacyCombinedController_iOS *)self setHeaderIcon:0];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23 = [(OBPrivacyCombinedController_iOS *)self bundles];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    unint64_t v25 = 0;
    do
    {
      v26 = [(OBPrivacyCombinedController_iOS *)self bundles];
      v27 = [v26 objectAtIndexedSubscript:v25];

      v28 = [v27 privacyFlow];
      if ([(OBPrivacyCombinedController_iOS *)self isUnifiedAbout]) {
        char v29 = [v28 showInCombinedList] ^ 1;
      }
      else {
        char v29 = 0;
      }
      if ([v28 platformSupported] && (v29 & 1) == 0)
      {
        v30 = [v28 identifier];
        if (([v30 isEqualToString:@"com.apple.onboarding.imessagefacetime"] & 1) == 0)
        {
          v31 = [v28 identifier];
          char v32 = [v31 isEqualToString:@"com.apple.onboarding.activation"];

          if (v32) {
            goto LABEL_23;
          }
          if ([(OBPrivacyCombinedController_iOS *)self isUnifiedAbout]
            && ([(OBPrivacyCombinedController_iOS *)self initialPrivacyFlow],
                v33 = objc_claimAutoreleasedReturnValue(),
                v33,
                !v33))
          {
            [(OBPrivacyCombinedController_iOS *)self setInitialPrivacyFlow:v28];
          }
          else
          {
            [v22 addObject:v28];
          }
          if (![v28 isPersonallyIdentifiable]) {
            goto LABEL_23;
          }
          v30 = [v28 buttonIcon];
          [(OBPrivacyCombinedController_iOS *)self setHeaderIcon:v30];
        }
      }
LABEL_23:

      ++v25;
      v34 = [(OBPrivacyCombinedController_iOS *)self bundles];
      unint64_t v35 = [v34 count];
    }
    while (v25 < v35);
  }
  v36 = (void *)[v22 copy];
  [(OBPrivacyCombinedController_iOS *)self setPrivacyFlows:v36];

  id v37 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v38 = objc_msgSend(v37, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v38];

  v39 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v39, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  v40 = [(OBTableWelcomeController *)self tableView];
  [v40 setDelegate:self];

  v41 = [(OBTableWelcomeController *)self tableView];
  [v41 setDataSource:self];

  v42 = [MEMORY[0x1E4FB1618] clearColor];
  v43 = [(OBTableWelcomeController *)self tableView];
  [v43 setBackgroundColor:v42];

  v44 = [(OBTableWelcomeController *)self tableView];
  [v44 setBackgroundView:0];

  v45 = [(OBTableWelcomeController *)self tableView];
  [v45 registerClass:objc_opt_class() forCellReuseIdentifier:@"privacyTitle"];

  v46 = [(OBTableWelcomeController *)self tableView];
  [v46 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"headerView"];

  v47 = [(OBTableWelcomeController *)self tableView];
  [v47 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"footerView"];

  v48 = [(OBWelcomeController *)self buttonTray];
  [v48 setHidden:1];

  v49 = [(OBPrivacyCombinedController *)self customTintColor];

  if (v49)
  {
    v52.receiver = self;
    v52.super_class = (Class)OBPrivacyCombinedController_iOS;
    v50 = [(OBPrivacyCombinedController *)&v52 customTintColor];
    v51 = [(OBPrivacyCombinedController_iOS *)self view];
    [v51 setTintColor:v50];
  }
  [(OBPrivacyCombinedController_iOS *)self _loadViewsWithContentFromBundles];
}

- (void)_loadViewsWithContentFromBundles
{
  v50[1] = *MEMORY[0x1E4F143B8];
  if ([(OBPrivacyCombinedController_iOS *)self isUnifiedAbout])
  {
    v3 = [OBPrivacyFlowGroup alloc];
    id v4 = [(OBPrivacyCombinedController_iOS *)self privacyFlows];
    v5 = [(OBPrivacyFlowGroup *)v3 initWithIdentifier:0 privacyFlows:v4];

    v50[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    [(OBPrivacyCombinedController_iOS *)self setPrivacyFlowGroups:v6];
  }
  else
  {
    v7 = [(OBPrivacyCombinedController_iOS *)self privacyFlows];
    v8 = [(OBPrivacyCombinedController *)self displayLanguage];
    objc_super v9 = +[OBPrivacyFlowGroup groupFlowsByCombinedHeader:v7 language:v8 preferredDeviceType:0];
    [(OBPrivacyCombinedController_iOS *)self setPrivacyFlowGroups:v9];
  }
  v10 = [(OBPrivacyCombinedController_iOS *)self initialPrivacyFlow];

  v11 = [(OBWelcomeController *)self headerView];
  if (!v10)
  {
    v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v40 = [(OBPrivacyCombinedController *)self displayLanguage];
    v41 = +[OBUtilities localizedString:@"COMBINED_SPLASH_TITLE" forTable:@"Localizable" inBundle:v39 forLanguage:v40];
    [v11 setTitle:v41];

    id v15 = [(OBWelcomeController *)self headerView];
    v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v37 = [(OBPrivacyCombinedController *)self displayLanguage];
    v38 = +[OBUtilities localizedString:@"COMBINED_SPLASH_DETAIL" forTable:@"Localizable" inBundle:v18 forLanguage:v37];
    [v15 setDetailText:v38];
LABEL_17:

    goto LABEL_18;
  }
  BOOL v12 = [(OBPrivacyCombinedController_iOS *)self initialPrivacyFlow];
  v13 = [(OBPrivacyCombinedController *)self displayLanguage];
  v14 = [v12 localizedTitleForLanguage:v13 preferredDeviceType:0];
  [v11 setTitle:v14];

  id v15 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v16 = [(OBPrivacyCombinedController_iOS *)self initialPrivacyFlow];
  v17 = [(OBPrivacyCombinedController *)self displayLanguage];
  v18 = [v16 localizedContentListForLanguage:v17 preferredDeviceType:0];

  if ([v18 count])
  {
    unint64_t v19 = 0;
    do
    {
      v20 = [v18 objectAtIndexedSubscript:v19];
      v21 = [v20 text];
      [v15 appendString:v21];

      if (v19 < [v18 count] - 1) {
        [v15 appendFormat:@"\n\n"];
      }

      ++v19;
    }
    while (v19 < [v18 count]);
  }
  if (![(OBPrivacyCombinedController *)self allowsOpeningSafari])
  {
    id v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v23 = [(OBPrivacyCombinedController *)self displayLanguage];
    uint64_t v24 = +[OBUtilities localizedString:@"PRIVACY_WEB_DESCRIPTION" forTable:@"Localizable" inBundle:v22 forLanguage:v23];
    unint64_t v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v26 = [(OBPrivacyCombinedController *)self displayLanguage];
    v27 = +[OBUtilities localizedString:@"PRIVACY_WEB_LINK" forTable:@"Localizable" inBundle:v25 forLanguage:v26];
    [v15 appendFormat:@" %@\n%@", v24, v27];
  }
  v28 = [(OBWelcomeController *)self headerView];
  [v28 setDetailText:v15];

  if ([(OBPrivacyCombinedController *)self allowsOpeningSafari])
  {
    char v29 = [(OBPrivacyCombinedController_iOS *)self linkToPrivacyGatewayButton];

    if (v29)
    {
      v30 = [(OBWelcomeController *)self headerView];
      [v30 removeAccessoryButton];
    }
    v31 = +[OBHeaderAccessoryButton accessoryButton];
    [(OBPrivacyCombinedController_iOS *)self setLinkToPrivacyGatewayButton:v31];

    char v32 = [(OBPrivacyCombinedController_iOS *)self linkToPrivacyGatewayButton];
    v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v34 = [(OBPrivacyCombinedController *)self displayLanguage];
    unint64_t v35 = +[OBUtilities localizedString:@"MANAGE_YOUR_DATA" forTable:@"Localizable" inBundle:v33 forLanguage:v34];
    [v32 setTitle:v35 forState:0];

    v36 = [(OBPrivacyCombinedController_iOS *)self linkToPrivacyGatewayButton];
    [v36 addTarget:self action:sel_showPrivacyGateway_ forControlEvents:0x2000];

    id v37 = [(OBWelcomeController *)self headerView];
    v38 = [(OBPrivacyCombinedController_iOS *)self linkToPrivacyGatewayButton];
    [v37 addAccessoryButton:v38];
    goto LABEL_17;
  }
LABEL_18:

  v42 = [(OBPrivacyCombinedController_iOS *)self headerIcon];

  if (v42)
  {
    v43 = [(OBWelcomeController *)self headerView];
    v44 = [(OBPrivacyCombinedController_iOS *)self headerIcon];
    v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v46 = [(OBPrivacyCombinedController *)self displayLanguage];
    v47 = +[OBUtilities localizedString:@"PRIVACY_ICON_DESCRIPTION" forTable:@"Localizable" inBundle:v45 forLanguage:v46];
    [v43 setIcon:v44 accessibilityLabel:v47];

    v48 = [(OBWelcomeController *)self headerView];
    [v48 setIconInheritsTint:1];
  }
  v49 = [(OBTableWelcomeController *)self tableView];
  [v49 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)OBPrivacyCombinedController_iOS;
  -[OBTableWelcomeController viewWillAppear:](&v20, sel_viewWillAppear_);
  v5 = [(OBTableWelcomeController *)self tableView];
  uint64_t v6 = [v5 indexPathForSelectedRow];

  if (v6)
  {
    v7 = [(OBPrivacyCombinedController_iOS *)self transitionCoordinator];
    if (v7)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke;
      v18[3] = &unk_1E58AEC08;
      v18[4] = self;
      id v19 = v6;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke_2;
      id v15 = &unk_1E58AEC08;
      v16 = self;
      id v17 = v19;
      [v7 animateAlongsideTransition:v18 completion:&v12];
    }
    else
    {
      v8 = [(OBTableWelcomeController *)self tableView];
      [v8 deselectRowAtIndexPath:v6 animated:v3];
    }
  }
  objc_super v9 = [(OBBaseWelcomeController *)self navigationItem];
  [v9 setTitle:0];

  v10 = [(OBPrivacyCombinedController *)self additionalDisplayLanguageManager];
  v11 = [(OBPrivacyCombinedController *)self displayLanguage];
  [v10 configureNavigationItemRightBarButtonItemForWelcomeController:self currentDisplayLanguage:v11 action:sel__languageToggleTapped];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBPrivacyCombinedController_iOS;
  [(OBWelcomeController *)&v4 viewDidDisappear:a3];
  [(OBWelcomeController *)self restoreNavigationBarAppearance];
}

- (void)showPrivacyGateway:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [(OBPrivacyCombinedController *)self displayLanguage];
  v7 = +[OBUtilities localizedString:@"PRIVACY_HTTP_WEB_LINK" forTable:@"Localizable" inBundle:v5 forLanguage:v6];
  v8 = [v4 URLWithString:v7];
  [v9 openURL:v8 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)setCustomTintColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyCombinedController_iOS;
  [(OBPrivacyCombinedController *)&v6 setCustomTintColor:v4];
  if ([(OBPrivacyCombinedController_iOS *)self isViewLoaded])
  {
    v5 = [(OBPrivacyCombinedController_iOS *)self view];
    [v5 setTintColor:v4];
  }
}

- (id)_privacyFlowForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(OBPrivacyCombinedController_iOS *)self privacyFlowGroups];
  objc_super v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v7 = [v6 privacyFlows];
  uint64_t v8 = [v4 row];

  id v9 = [v7 objectAtIndexedSubscript:v8];

  return v9;
}

- (void)_languageToggleTapped
{
  BOOL v3 = [(OBPrivacyCombinedController *)self additionalDisplayLanguageManager];
  id v4 = [(OBPrivacyCombinedController *)self displayLanguage];
  v5 = [v3 didTapRightBarButtonItemForWelcomeController:self currentDisplayLanguage:v4];
  [(OBPrivacyCombinedController *)self setDisplayLanguage:v5];

  objc_super v6 = [(OBPrivacyCombinedController *)self additionalDisplayLanguageManager];
  v7 = [(OBPrivacyCombinedController *)self displayLanguage];
  [v6 configureNavigationItemRightBarButtonItemForWelcomeController:self currentDisplayLanguage:v7 action:sel__languageToggleTapped];

  [(OBPrivacyCombinedController_iOS *)self _loadViewsWithContentFromBundles];
  id v8 = [(OBPrivacyCombinedController_iOS *)self view];
  [v8 setNeedsLayout];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = [(OBPrivacyCombinedController_iOS *)self _privacyFlowForIndexPath:a4];
  v5 = [[OBPrivacySplashController alloc] initWithFlow:v10];
  [(OBPrivacySplashController *)v5 setUnderlineLinks:[(OBPrivacyCombinedController *)self underlineLinks]];
  objc_super v6 = [(OBPrivacyCombinedController *)self displayLanguage];
  [(OBPrivacySplashController *)v5 setDisplayLanguage:v6];

  v7 = [(OBPrivacyCombinedController *)self additionalDisplayLanguageManager];
  [(OBPrivacySplashController *)v5 setAdditionalDisplayLanguageManager:v7];

  [(OBPrivacySplashController *)v5 setShowsLinkToUnifiedAbout:[(OBPrivacyCombinedController_iOS *)self isUnifiedAbout] ^ 1];
  id v8 = [(OBPrivacyCombinedController *)self customTintColor];
  [(OBPrivacySplashController *)v5 setCustomTintColor:v8];

  [(OBWelcomeController *)v5 setDarkMode:[(OBWelcomeController *)self darkMode]];
  id v9 = [(OBPrivacyCombinedController_iOS *)self navigationController];
  [v9 pushViewController:v5 animated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(OBPrivacyCombinedController_iOS *)self privacyFlowGroups];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(OBPrivacyCombinedController_iOS *)self privacyFlowGroups];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];
  v7 = [v6 privacyFlows];
  int64_t v8 = [v7 count];

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(OBPrivacyCombinedController_iOS *)self privacyFlowGroups];
  int64_t v8 = [v7 objectAtIndexedSubscript:a4];

  id v9 = [v8 identifier];

  if (v9)
  {
    id v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    id v10 = [MEMORY[0x1E4FB1948] groupedFooterConfiguration];
    v11 = [v8 identifier];
    [v10 setText:v11];

    uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v13 = [v10 textProperties];
    [v13 setColor:v12];

    v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    id v15 = [v10 textProperties];
    [v15 setFont:v14];

    v16 = [v10 textProperties];
    [v16 setTransform:0];

    [v9 setContentConfiguration:v10];
  }

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v46[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(OBPrivacyCombinedController_iOS *)self privacyFlowGroups];
  int64_t v8 = [v7 objectAtIndexedSubscript:a4];

  id v9 = [v8 privacyFlows];
  id v10 = [v9 firstObject];
  v11 = [(OBPrivacyCombinedController *)self displayLanguage];
  uint64_t v12 = [v10 localizedCombinedFooterForLanguage:v11 preferredDeviceType:0];

  if (v12)
  {
    uint64_t v13 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"footerView"];
    id v14 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    v44 = v8;
    id v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setAttributedText:v12];
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [v15 setTextColor:v16];

    id v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v15 setFont:v17];

    [v15 setScrollEnabled:0];
    [v15 setEditable:0];
    [v15 setSelectable:1];
    [v15 setInsetsLayoutMarginsFromSafeArea:0];
    v18 = [v15 textContainer];
    [v18 setLineFragmentPadding:0.0];

    [v15 setDelegate:self];
    id v19 = [v13 contentView];
    [v19 addSubview:v15];

    v33 = (void *)MEMORY[0x1E4F28DC8];
    v41 = [v15 leadingAnchor];
    v42 = [v13 contentView];
    v40 = [v42 layoutMarginsGuide];
    v39 = [v40 leadingAnchor];
    v38 = [v41 constraintEqualToAnchor:v39];
    v46[0] = v38;
    v36 = [v15 trailingAnchor];
    id v37 = [v13 contentView];
    unint64_t v35 = [v37 layoutMarginsGuide];
    v34 = [v35 trailingAnchor];
    char v32 = [v36 constraintEqualToAnchor:v34];
    v46[1] = v32;
    v30 = [v15 topAnchor];
    v31 = [v13 contentView];
    char v29 = [v31 layoutMarginsGuide];
    objc_super v20 = [v29 topAnchor];
    v21 = [v30 constraintEqualToAnchor:v20];
    v46[2] = v21;
    id v22 = [v15 bottomAnchor];
    id v45 = v13;
    [v13 contentView];
    v23 = v43 = v12;
    uint64_t v24 = [v23 layoutMarginsGuide];
    unint64_t v25 = [v24 bottomAnchor];
    v26 = [v22 constraintEqualToAnchor:v25];
    v46[3] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    [v33 activateConstraints:v27];

    uint64_t v12 = v43;
    int64_t v8 = v44;
  }
  else
  {
    id v45 = 0;
  }

  return v45;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"privacyTitle"];
  int64_t v8 = [(OBPrivacyCombinedController_iOS *)self _privacyFlowForIndexPath:v6];

  id v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v9];

  [v7 setSelectionStyle:0];
  id v10 = [v7 textLabel];
  v11 = [(OBPrivacyCombinedController *)self displayLanguage];
  uint64_t v12 = [v8 localizedShortTitleForLanguage:v11 preferredDeviceType:0];
  [v10 setText:v12];

  uint64_t v13 = [v7 textLabel];
  id v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v13 setTextColor:v14];

  id v15 = [v7 textLabel];
  v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v15 setFont:v16];

  id v17 = [v7 textLabel];
  [v17 setNumberOfLines:0];

  [v7 setAccessoryType:1];
  [v7 setSelectionStyle:2];
  v18 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v7 setBackgroundColor:v18];

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v6 = (void *)MEMORY[0x1E4F223E0];
  id v7 = a4;
  int64_t v8 = [v6 defaultWorkspace];
  [v8 openSensitiveURL:v7 withOptions:0];

  return 0;
}

- (NSArray)bundles
{
  return self->_bundles;
}

- (void)setBundles:(id)a3
{
}

- (NSArray)privacyFlowGroups
{
  return (NSArray *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setPrivacyFlowGroups:(id)a3
{
}

- (BOOL)isUnifiedAbout
{
  return self->_isUnifiedAbout;
}

- (void)setIsUnifiedAbout:(BOOL)a3
{
  self->_isUnifiedAbout = a3;
}

- (OBPrivacyFlow)initialPrivacyFlow
{
  return self->_initialPrivacyFlow;
}

- (void)setInitialPrivacyFlow:(id)a3
{
}

- (NSArray)privacyFlows
{
  return self->_privacyFlows;
}

- (void)setPrivacyFlows:(id)a3
{
}

- (UIImage)headerIcon
{
  return self->_headerIcon;
}

- (void)setHeaderIcon:(id)a3
{
}

- (OBHeaderAccessoryButton)linkToPrivacyGatewayButton
{
  return self->_linkToPrivacyGatewayButton;
}

- (void)setLinkToPrivacyGatewayButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkToPrivacyGatewayButton, 0);
  objc_storeStrong((id *)&self->_headerIcon, 0);
  objc_storeStrong((id *)&self->_privacyFlows, 0);
  objc_storeStrong((id *)&self->_initialPrivacyFlow, 0);
  objc_storeStrong((id *)&self->_privacyFlowGroups, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

@end