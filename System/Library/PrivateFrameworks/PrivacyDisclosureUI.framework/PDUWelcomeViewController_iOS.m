@interface PDUWelcomeViewController_iOS
- (BOOL)_canShowWhileLocked;
- (OBTrayButton)continueButton;
- (PDUWelcomeViewControllerDelegate)delegate;
- (PDUWelcomeViewController_iOS)initWithApplicationIdentity:(id)a3 consentStore:(id)a4;
- (UIColor)continueButtonOriginalTextColor;
- (id)_requestIconForApplication:(id)a3;
- (int64_t)preferredUserInterfaceStyle;
- (void)_updateContinueButtonConfiguration;
- (void)cancelPressed;
- (void)continuePressed;
- (void)disclosureReviewViewControllerDidDismiss:(id)a3;
- (void)learnMorePressed;
- (void)setContinueButton:(id)a3;
- (void)setContinueButtonOriginalTextColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PDUWelcomeViewController_iOS

- (PDUWelcomeViewController_iOS)initWithApplicationIdentity:(id)a3 consentStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v19 = 0;
  v9 = [v7 findApplicationRecordWithError:&v19];
  id v10 = v19;
  v11 = PDUWelcomeTitleTextForAppRecord(v9);
  v12 = PDUWelcomeDetailTextForAppRecord(v9);
  v13 = [(PDUWelcomeViewController_iOS *)self _requestIconForApplication:v9];
  v18.receiver = self;
  v18.super_class = (Class)PDUWelcomeViewController_iOS;
  v14 = [(PDUWelcomeViewController_iOS *)&v18 initWithTitle:v11 detailText:v12 icon:v13 contentLayout:2];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_applicationIdentity, a3);
    objc_storeStrong((id *)&v15->_applicationRecord, v9);
    objc_storeStrong((id *)&v15->_consentStore, a4);
    v16 = v15;
  }

  return v15;
}

- (id)_requestIconForApplication:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F4B540];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 bundleIdentifier];

  id v8 = (void *)[v6 initWithBundleIdentifier:v7];
  v9 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B578]];
  [v9 setDrawBorder:1];
  id v10 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:", objc_msgSend(v8, "CGImageForDescriptor:", v9));
  objc_initWeak(&location, self);
  v11 = dispatch_get_global_queue(21, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke;
  v15[3] = &unk_26547A5B8;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  objc_copyWeak(&v18, &location);
  dispatch_async(v11, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v10;
}

- (void)viewDidLoad
{
  v54[4] = *MEMORY[0x263EF8340];
  applicationIdentity = self->_applicationIdentity;
  id v53 = 0;
  v4 = [(PDCApplicationIdentity *)applicationIdentity findApplicationRecordWithError:&v53];
  id v5 = v53;
  id v6 = PDULocalizedNameForAppRecord(v4);
  id v7 = PDUWelcomeTintColorForApplicationRecord(v4);
  if (v7)
  {
    id v8 = [(PDUWelcomeViewController_iOS *)self view];
    [v8 setTintColor:v7];
  }
  v9 = [MEMORY[0x263F5B898] boldButton];
  id v10 = PDULocalizedString(@"WELCOME_CONTINUE");
  [v9 setTitle:v10 forState:0];

  [v9 addTarget:self action:sel_continuePressed forControlEvents:64];
  [v9 setAccessibilityIdentifier:@"continue-button"];
  v11 = [(PDUWelcomeViewController_iOS *)self buttonTray];
  [v11 addButton:v9];

  v51 = [v7 convertedToRGB];
  if (v51)
  {
    id v12 = [v9 titleLabel];
    id v13 = [v12 textColor];
    v14 = [v13 convertedToRGB];
    int v15 = [v14 isEqual:v51];

    if (v15)
    {
      id v16 = [v9 configuration];
      id v17 = [v16 baseForegroundColor];
      [(PDUWelcomeViewController_iOS *)self setContinueButtonOriginalTextColor:v17];

      id v18 = [MEMORY[0x263F1C550] blackColor];
      [v16 setBaseForegroundColor:v18];

      [v9 setConfiguration:v16];
      [v9 setNeedsUpdateConfiguration];
    }
  }
  v50 = v7;
  [(PDUWelcomeViewController_iOS *)self setContinueButton:v9];
  id v19 = [MEMORY[0x263F5B8D0] linkButton];
  v20 = PDULocalizedString(@"WELCOME_CLOSE");
  v21 = objc_msgSend(NSString, "stringWithFormat:", v20, v6);
  [v19 setTitle:v21 forState:0];

  [v19 addTarget:self action:sel_cancelPressed forControlEvents:64];
  [v19 setAccessibilityIdentifier:@"cancel-button"];
  v22 = [(PDUWelcomeViewController_iOS *)self buttonTray];
  [v22 addButton:v19];

  if (PDUShouldShowLearnMoreScreen(v4))
  {
    [MEMORY[0x263F1C488] buttonWithType:1];
    v23 = v48 = v6;
    v24 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F1D268] variant:0];
    [v23 titleLabel];
    v25 = v47 = v20;
    [v25 setFont:v24];

    v26 = [v23 titleLabel];
    [v26 setAdjustsFontForContentSizeCategory:1];

    v27 = PDULocalizedString(@"WELCOME_LEARN_MORE");
    [v23 setTitle:v27 forState:0];

    [v23 addTarget:self action:sel_learnMorePressed forControlEvents:64];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = [(PDUWelcomeViewController_iOS *)self contentView];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    v29 = [(PDUWelcomeViewController_iOS *)self contentView];
    [v29 addSubview:v23];

    v30 = (void *)MEMORY[0x263F08938];
    v31 = [(PDUWelcomeViewController_iOS *)self contentView];
    v32 = [v30 constraintWithItem:v23 attribute:3 relatedBy:0 toItem:v31 attribute:3 multiplier:1.0 constant:0.0];

    v33 = (void *)MEMORY[0x263F08938];
    v34 = [(PDUWelcomeViewController_iOS *)self contentView];
    v35 = [v33 constraintWithItem:v23 attribute:9 relatedBy:0 toItem:v34 attribute:9 multiplier:1.0 constant:0.0];

    v36 = (void *)MEMORY[0x263F08938];
    [(PDUWelcomeViewController_iOS *)self contentView];
    v37 = id v49 = v5;
    v38 = [v36 constraintWithItem:v37 attribute:7 relatedBy:1 toItem:v23 attribute:7 multiplier:1.0 constant:0.0];

    v39 = (void *)MEMORY[0x263F08938];
    [(PDUWelcomeViewController_iOS *)self contentView];
    v40 = v46 = v4;
    v41 = [v39 constraintWithItem:v40 attribute:8 relatedBy:0 toItem:v23 attribute:8 multiplier:1.0 constant:0.0];

    v42 = [(PDUWelcomeViewController_iOS *)self contentView];
    v54[0] = v32;
    v54[1] = v35;
    v54[2] = v41;
    v54[3] = v38;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];
    [v42 addConstraints:v43];

    v4 = v46;
    id v5 = v49;

    v20 = v47;
    id v6 = v48;
  }
  v44 = [(PDUWelcomeViewController_iOS *)self view];
  [v44 setAccessibilityIdentifier:@"pdui-welcome-view"];

  v45 = [(PDUWelcomeViewController_iOS *)self contentView];
  [v45 layoutIfNeeded];

  v52.receiver = self;
  v52.super_class = (Class)PDUWelcomeViewController_iOS;
  [(OBBaseWelcomeController *)&v52 viewDidLoad];
}

- (void)continuePressed
{
  v3 = [(PDUWelcomeViewController_iOS *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v8 = [(PDCApplicationRecord *)self->_applicationRecord regulatoryPrivacyDisclosureVersion];
    id v5 = [(PDCApplicationRecord *)self->_applicationRecord bundleIdentifier];
    id v6 = (id)[(PDCConsentStore *)self->_consentStore writeUserConsentedRegulatoryDisclosureVersion:v8 forBundleIdentifier:v5];
    id v7 = [(PDUWelcomeViewController_iOS *)self delegate];
    [v7 welcomeViewController:self didDismissWithUserResponse:1];
  }
}

- (void)cancelPressed
{
  v3 = [(PDUWelcomeViewController_iOS *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PDUWelcomeViewController_iOS *)self delegate];
    [v5 welcomeViewController:self didDismissWithUserResponse:0];
  }
}

- (void)learnMorePressed
{
  v3 = (void *)MEMORY[0x263F086E0];
  char v4 = [(PDCApplicationRecord *)self->_applicationRecord URL];
  id v13 = [v3 bundleWithURL:v4];

  id v5 = [[PDUDisclosureReviewViewController_iOS alloc] initWithBundle:v13 variant:0];
  [(PDUDisclosureReviewViewController_iOS *)v5 setDelegate:self];
  id v6 = [(PDUWelcomeViewController_iOS *)self view];
  id v7 = [v6 tintColor];
  id v8 = [(PDUDisclosureReviewViewController_iOS *)v5 view];
  [v8 setTintColor:v7];

  v9 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v5];
  id v10 = [(PDUWelcomeViewController_iOS *)self view];
  v11 = [v10 tintColor];
  id v12 = [v9 view];
  [v12 setTintColor:v11];

  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", -[PDUWelcomeViewController_iOS preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle"));
  [(PDUWelcomeViewController_iOS *)self presentViewController:v9 animated:1 completion:0];
}

- (void)disclosureReviewViewControllerDidDismiss:(id)a3
{
}

- (int64_t)preferredUserInterfaceStyle
{
  v3 = +[PDUAppDisclosureStyle styleWithApplication:self->_applicationRecord];
  int64_t v4 = [v3 interfaceStyle];

  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PDUWelcomeViewController_iOS;
    return [(PDUWelcomeViewController_iOS *)&v6 preferredUserInterfaceStyle];
  }
  return v4;
}

- (void)_updateContinueButtonConfiguration
{
  v3 = [(PDUWelcomeViewController_iOS *)self view];
  id v16 = [v3 tintColor];

  int64_t v4 = [(PDUWelcomeViewController_iOS *)self continueButton];
  id v5 = [v4 configuration];

  objc_super v6 = [v16 convertedToRGB];
  if (!v6) {
    goto LABEL_4;
  }
  id v7 = [(PDUWelcomeViewController_iOS *)self continueButton];
  id v8 = [v7 titleLabel];
  v9 = [v8 textColor];
  id v10 = [v9 convertedToRGB];
  int v11 = [v10 isEqual:v6];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F1C550] blackColor];
  }
  else
  {
LABEL_4:
    uint64_t v12 = [(PDUWelcomeViewController_iOS *)self continueButtonOriginalTextColor];
  }
  id v13 = (void *)v12;
  [v5 setBaseForegroundColor:v12];

  v14 = [(PDUWelcomeViewController_iOS *)self continueButton];
  [v14 setConfiguration:v5];

  int v15 = [(PDUWelcomeViewController_iOS *)self continueButton];
  [v15 setNeedsUpdateConfiguration];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDUWelcomeViewController_iOS;
  id v4 = a3;
  [(PDUWelcomeViewController_iOS *)&v7 traitCollectionDidChange:v4];
  id v5 = [(PDUWelcomeViewController_iOS *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PDUWelcomeViewController_iOS *)self _updateContinueButtonConfiguration];
  }
}

- (PDUWelcomeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDUWelcomeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBTrayButton)continueButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continueButton);
  return (OBTrayButton *)WeakRetained;
}

- (void)setContinueButton:(id)a3
{
}

- (UIColor)continueButtonOriginalTextColor
{
  return self->_continueButtonOriginalTextColor;
}

- (void)setContinueButtonOriginalTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtonOriginalTextColor, 0);
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_consentStore, 0);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
}

@end