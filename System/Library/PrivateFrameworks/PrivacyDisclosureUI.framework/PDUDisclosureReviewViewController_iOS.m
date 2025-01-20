@interface PDUDisclosureReviewViewController_iOS
- (BOOL)_canShowWhileLocked;
- (PDUDisclosureReviewViewControllerDelegate)delegate;
- (PDUDisclosureReviewViewController_iOS)initWithBundle:(id)a3 variant:(unint64_t)a4;
- (id)footerForSettings;
- (id)headerForAlert;
- (id)headerForSettings;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)aboutPrivacyTapped;
- (void)configureForAlert;
- (void)configureForSettings;
- (void)doneTapped;
- (void)setDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PDUDisclosureReviewViewController_iOS

- (PDUDisclosureReviewViewController_iOS)initWithBundle:(id)a3 variant:(unint64_t)a4
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PDUDisclosureReviewViewController_iOS;
  v8 = [(PDUDisclosureReviewViewController_iOS *)&v24 initWithStyle:2];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundle, a3);
    v9->_variant = a4;
    id v22 = 0;
    id v23 = 0;
    PDURetrieveLocalizedTitlesAndDescriptions(v7, &v23, &v22);
    v10 = (NSArray *)v23;
    v11 = (NSArray *)v22;
    titles = v9->_titles;
    v9->_titles = v10;
    v13 = v10;

    descriptions = v9->_descriptions;
    v9->_descriptions = v11;

    v15 = [(PDUDisclosureReviewViewController_iOS *)v9 tableView];
    [v15 registerClass:objc_opt_class() forCellReuseIdentifier:@"DISCLOSURE_CELL"];

    v16 = [(PDUDisclosureReviewViewController_iOS *)v9 tableView];
    [v16 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"DISCLOSURE_HEADER"];

    v17 = [(PDUDisclosureReviewViewController_iOS *)v9 tableView];
    [v17 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"DISCLOSURE_FOOTER"];

    uint64_t v18 = [(NSBundle *)v9->_bundle pdu_aboutPrivacyBundleID];
    obkBundleID = v9->_obkBundleID;
    v9->_obkBundleID = (NSString *)v18;

    v20 = v9;
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDUDisclosureReviewViewController_iOS;
  [(PDUDisclosureReviewViewController_iOS *)&v5 viewWillAppear:a3];
  if (!self->_isConfigured)
  {
    unint64_t variant = self->_variant;
    if (variant == 1)
    {
      [(PDUDisclosureReviewViewController_iOS *)self configureForSettings];
    }
    else if (!variant)
    {
      [(PDUDisclosureReviewViewController_iOS *)self configureForAlert];
    }
    self->_isConfigured = 1;
  }
}

- (void)configureForAlert
{
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  PDULocalizedString(@"REVIEW_DONE");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)[v3 initWithTitle:v6 image:0 target:self action:sel_doneTapped menu:0];
  objc_super v5 = [(PDUDisclosureReviewViewController_iOS *)self navigationItem];
  [v5 setRightBarButtonItem:v4];
}

- (void)configureForSettings
{
  PDULocalizedNameForBundle(self->_bundle);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(PDUDisclosureReviewViewController_iOS *)self navigationItem];
  [v3 setTitle:v4];
}

- (void)doneTapped
{
  id v3 = [(PDUDisclosureReviewViewController_iOS *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 disclosureReviewViewControllerDidDismiss:self];
  }
}

- (void)aboutPrivacyTapped
{
  id v8 = [(NSBundle *)self->_bundle pathForResource:self->_obkBundleID ofType:@"bundle"];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:v8];

  if (v4) {
    [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithBundleAtPath:v8];
  }
  else {
  objc_super v5 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:self->_obkBundleID];
  }
  [v5 setPresentingViewController:self];
  id v6 = [(PDUDisclosureReviewViewController_iOS *)self view];
  id v7 = [v6 tintColor];
  [v5 setCustomTintColor:v7];

  [v5 present];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4) {
    goto LABEL_2;
  }
  unint64_t variant = self->_variant;
  if (variant == 1)
  {
    uint64_t v9 = [(PDUDisclosureReviewViewController_iOS *)self headerForSettings];
  }
  else
  {
    if (variant)
    {
LABEL_2:
      id v7 = 0;
      goto LABEL_8;
    }
    uint64_t v9 = [(PDUDisclosureReviewViewController_iOS *)self headerForAlert];
  }
  id v7 = (void *)v9;
LABEL_8:

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(NSArray *)self->_titles count] - 1 == a4 && self->_variant == 1)
  {
    objc_super v5 = [(PDUDisclosureReviewViewController_iOS *)self footerForSettings];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (id)headerForSettings
{
  id v3 = [(PDUDisclosureReviewViewController_iOS *)self tableView];
  int v4 = [v3 dequeueReusableHeaderFooterViewWithIdentifier:@"DISCLOSURE_HEADER"];

  objc_super v5 = [v4 defaultContentConfiguration];
  id v6 = NSString;
  id v7 = PDULocalizedString(@"LEARN_MORE_SUBTITLE");
  id v8 = PDULocalizedNameForBundle(self->_bundle);
  uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);
  [v5 setText:v9];

  v10 = [v5 textProperties];
  [v10 setTransform:0];

  v11 = [v5 textProperties];
  [v11 setLineBreakMode:0];

  v12 = [v5 textProperties];
  [v12 setNumberOfLines:0];

  [v5 directionalLayoutMargins];
  double v14 = v13;
  [v5 directionalLayoutMargins];
  double v16 = v15;
  [v5 directionalLayoutMargins];
  objc_msgSend(v5, "setDirectionalLayoutMargins:", v14, v16, 32.0);
  [v4 setContentConfiguration:v5];

  return v4;
}

- (id)footerForSettings
{
  v51[1] = *MEMORY[0x263EF8340];
  if (self->_obkBundleID)
  {
    id v3 = [(PDUDisclosureReviewViewController_iOS *)self tableView];
    int v4 = [v3 dequeueReusableHeaderFooterViewWithIdentifier:@"DISCLOSURE_FOOTER"];

    objc_super v5 = [v4 defaultContentConfiguration];
    [v5 directionalLayoutMargins];
    double v7 = v6;
    [v5 directionalLayoutMargins];
    double v9 = v8;
    [v5 directionalLayoutMargins];
    objc_msgSend(v5, "setDirectionalLayoutMargins:", 32.0, v7, v9);
    [v4 setContentConfiguration:v5];

    v46 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    v10 = [MEMORY[0x263F1C490] borderlessButtonConfiguration];
    v11 = NSString;
    v12 = PDULocalizedString(@"SETTINGS_ABOUT_PRIVACY");
    double v13 = PDULocalizedNameForBundle(self->_bundle);
    v45 = objc_msgSend(v11, "stringWithFormat:", v12, v13);

    id v14 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v50 = *MEMORY[0x263F814F0];
    v51[0] = v46;
    double v15 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
    double v16 = (void *)[v14 initWithString:v45 attributes:v15];
    [v10 setAttributedTitle:v16];

    [v10 setTitleAlignment:1];
    [v10 setButtonSize:2];
    [v10 contentInsets];
    double v18 = v17;
    [v10 contentInsets];
    v44 = v10;
    objc_msgSend(v10, "setContentInsets:", v18, 0.0);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __58__PDUDisclosureReviewViewController_iOS_footerForSettings__block_invoke;
    v48[3] = &unk_26547A5E0;
    v48[4] = self;
    v43 = [MEMORY[0x263F1C3C0] actionWithHandler:v48];
    v19 = [MEMORY[0x263F1C488] buttonWithConfiguration:v10 primaryAction:v43];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [v4 contentView];
    [v20 addSubview:v19];

    v47 = [v4 contentView];
    v41 = [v19 leadingAnchor];
    v21 = v4;
    v42 = [v4 contentView];
    v40 = [v42 layoutMarginsGuide];
    v39 = [v40 leadingAnchor];
    v38 = [v41 constraintEqualToAnchor:v39];
    v49[0] = v38;
    v36 = [v19 trailingAnchor];
    v37 = [v4 contentView];
    v35 = [v37 layoutMarginsGuide];
    v34 = [v35 trailingAnchor];
    v33 = [v36 constraintLessThanOrEqualToAnchor:v34];
    v49[1] = v33;
    v32 = [v19 topAnchor];
    id v22 = [v4 contentView];
    id v23 = [v22 topAnchor];
    objc_super v24 = [v32 constraintEqualToAnchor:v23];
    v49[2] = v24;
    v25 = [v19 bottomAnchor];
    v26 = [v21 contentView];
    v27 = [v26 bottomAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v49[3] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
    [v47 addConstraints:v29];

    v30 = [v21 contentView];
    [v30 setNeedsLayout];
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)headerForAlert
{
  id v3 = [MEMORY[0x263EFF980] array];
  int v4 = (objc_class *)MEMORY[0x263F1C768];
  objc_super v5 = self->_bundle;
  id v6 = objc_alloc_init(v4);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v7 = NSString;
  double v8 = PDULocalizedString(@"LEARN_MORE_TITLE");
  double v9 = PDULocalizedNameForBundle(v5);

  v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

  [v6 setText:v10];
  v11 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F1D2B0] weight:*MEMORY[0x263F81800]];
  [v6 setFont:v11];

  [v6 setNumberOfLines:0];
  [v6 setTextAlignment:1];
  LODWORD(v12) = 1148846080;
  [v6 setContentHuggingPriority:1 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [v6 setContentCompressionResistancePriority:1 forAxis:v13];

  [v3 addObject:v6];
  id v14 = (objc_class *)MEMORY[0x263F1C768];
  double v15 = self->_bundle;
  id v16 = objc_alloc_init(v14);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v17 = NSString;
  double v18 = PDULocalizedString(@"LEARN_MORE_SUBTITLE");
  v19 = PDULocalizedNameForBundle(v15);

  v20 = objc_msgSend(v17, "stringWithFormat:", v18, v19);

  [v16 setText:v20];
  v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v16 setFont:v21];

  [v16 setNumberOfLines:0];
  [v16 setTextAlignment:1];
  LODWORD(v22) = 1148846080;
  [v16 setContentHuggingPriority:1 forAxis:v22];
  LODWORD(v23) = 1148846080;
  [v16 setContentCompressionResistancePriority:1 forAxis:v23];

  [v3 addObject:v16];
  if (self->_obkBundleID)
  {
    objc_super v24 = [MEMORY[0x263F1C490] borderlessButtonConfiguration];
    v25 = NSString;
    v26 = PDULocalizedString(@"ABOUT_PRIVACY");
    v27 = PDULocalizedNameForBundle(self->_bundle);
    v28 = objc_msgSend(v25, "stringWithFormat:", v26, v27);
    [v24 setTitle:v28];

    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __55__PDUDisclosureReviewViewController_iOS_headerForAlert__block_invoke;
    v36[3] = &unk_26547A5E0;
    v36[4] = self;
    v29 = [MEMORY[0x263F1C3C0] actionWithHandler:v36];
    v30 = [MEMORY[0x263F1C488] buttonWithConfiguration:v24 primaryAction:v29];
    [v3 addObject:v30];
  }
  v31 = stackForViews(v3);
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  v32 = [(PDUDisclosureReviewViewController_iOS *)self tableView];
  v33 = [v32 dequeueReusableHeaderFooterViewWithIdentifier:@"DISCLOSURE_HEADER"];

  v34 = [v33 contentView];
  fillViewWithNewSubview(v34, v31);

  return v33;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_titles count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"DISCLOSURE_CELL" forIndexPath:v6];
  [v7 setSelectionStyle:0];
  double v8 = [MEMORY[0x263F1C780] subtitleCellConfiguration];
  double v9 = -[NSArray objectAtIndexedSubscript:](self->_descriptions, "objectAtIndexedSubscript:", [v6 section]);
  [v8 setSecondaryText:v9];

  titles = self->_titles;
  uint64_t v11 = [v6 section];

  double v12 = [(NSArray *)titles objectAtIndexedSubscript:v11];
  [v8 setText:v12];

  double v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D268]];
  id v14 = [v8 secondaryTextProperties];
  [v14 setFont:v13];

  double v15 = (void *)MEMORY[0x263F81708];
  id v16 = [v8 textProperties];
  double v17 = [v16 font];
  [v17 pointSize];
  double v18 = objc_msgSend(v15, "systemFontOfSize:weight:");
  v19 = [v8 textProperties];
  [v19 setFont:v18];

  [v8 setTextToSecondaryTextVerticalPadding:8.0];
  [v8 directionalLayoutMargins];
  double v21 = v20;
  [v8 directionalLayoutMargins];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 16.0, v21, 16.0);
  [v7 setContentConfiguration:v8];

  return v7;
}

- (int64_t)preferredUserInterfaceStyle
{
  v2 = [(PDUDisclosureReviewViewController_iOS *)self presentingViewController];
  int64_t v3 = [v2 preferredUserInterfaceStyle];

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PDUDisclosureReviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDUDisclosureReviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_obkBundleID, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end