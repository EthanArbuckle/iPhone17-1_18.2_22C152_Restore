@interface PKAccountAutomaticPaymentsHeroViewController
- (BOOL)showSetupPrompt;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (PKAccountAutomaticPaymentsHeroViewController)initWithController:(id)a3;
- (id)_autoPayMenuPromptBodyAttributedString;
- (void)_notNowAction:(id)a3;
- (void)_updateSetupPrompt;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setShowSetupPrompt:(BOOL)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountAutomaticPaymentsHeroViewController

- (PKAccountAutomaticPaymentsHeroViewController)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountAutomaticPaymentsHeroViewController;
  v6 = [(PKExplanationViewController *)&v9 initWithContext:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v7->_featureIdentifier = [v5 featureIdentifier];
  }

  return v7;
}

- (void)viewDidLoad
{
  v39[3] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PKAccountAutomaticPaymentsHeroViewController;
  [(PKExplanationViewController *)&v35 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = PKLocalizedFeatureString();
  [v3 setTitleText:v4];

  id v5 = PKLocalizedFeatureString();
  [v3 setBodyText:v5];

  v34 = [MEMORY[0x1E4FB1830] configurationWithPointSize:70.0];
  v33 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:withConfiguration:", @"clock.arrow.2.circlepath");
  objc_msgSend(v3, "setImage:");
  [v3 setDelegate:self];
  [v3 setShowPrivacyView:0];
  [v3 setTitleHyphenationFactor:0.1];
  [v3 setTitleAccessoriesEnabled:0];
  v6 = [v3 dockView];
  v7 = [v6 primaryButton];
  v8 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  [v7 setTitle:v8 forState:0];

  objc_msgSend(v7, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_super v9 = [v7 titleLabel];
  [v9 setAdjustsFontSizeToFitWidth:1];

  v30 = v7;
  [v7 sizeToFit];
  [(PKAccountAutomaticPaymentsHeroViewController *)self _updateSetupPrompt];
  v10 = [v3 dockView];
  v11 = [v10 buttonExplanationTextView];

  v12 = PKLocalizedFeatureString();
  v13 = [(PKAccountAutomaticPaymentsController *)self->_controller account];
  v14 = [v13 creditDetails];
  v15 = [v14 accountSummary];

  uint64_t v16 = [v15 balanceStatus];
  int v17 = [v15 requiresDebtCollectionNotices];
  v32 = v6;
  v31 = v12;
  if (v16 == 2 || v17)
  {
    v19 = PKLocalizedFeatureString();
    id v18 = [NSString stringWithFormat:@"%@\n\n%@", v19, v12];
  }
  else
  {
    id v18 = v12;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v20 setLineBreakMode:0];
  [v20 setAlignment:1];
  v38[0] = *MEMORY[0x1E4FB06F8];
  v21 = [v11 font];
  uint64_t v22 = *MEMORY[0x1E4FB0738];
  v39[0] = v21;
  v39[1] = v20;
  uint64_t v23 = *MEMORY[0x1E4FB0700];
  v38[1] = v22;
  v38[2] = v23;
  v24 = [v11 textColor];
  v39[2] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];

  v26 = PKAttributedStringByParsingLinksInString();
  [v11 setAttributedText:v26];
  [v11 setDelegate:self];
  [v11 setDataDetectorTypes:2];
  uint64_t v36 = v23;
  v27 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v37 = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  [v11 setLinkTextAttributes:v28];

  v29 = [(PKAccountAutomaticPaymentsHeroViewController *)self view];
  [v29 setAccessibilityIdentifier:*MEMORY[0x1E4F85968]];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PKAccountAutomaticPaymentsController *)self->_controller account];
  v11 = [v10 creditDetails];
  v12 = [v11 termsIdentifier];

  if (v12)
  {
    v13 = [PKAccountTermsAndConditionsController alloc];
    v14 = [MEMORY[0x1E4F84D50] sharedService];
    v15 = [(PKAccountTermsAndConditionsController *)v13 initWithAccount:v10 webService:v14 context:[(PKAccountAutomaticPaymentsController *)self->_controller paymentSetupContext] termsIdentifier:v12];
    termsController = self->_termsController;
    self->_termsController = v15;

    objc_initWeak(location, self);
    int v17 = self->_termsController;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __99__PKAccountAutomaticPaymentsHeroViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v21[3] = &unk_1E59CB9C8;
    objc_copyWeak(&v22, location);
    [(PKAccountTermsAndConditionsController *)v17 termsViewControllerWithCompletion:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v10 accountIdentifier];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Error: Account: %@ is missing terms and conditions. Using the value in the pass instead.", (uint8_t *)location, 0xCu);
    }
  }

  return 0;
}

void __99__PKAccountAutomaticPaymentsHeroViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      id v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      if (!v9) {
        goto LABEL_7;
      }
      id v7 = [WeakRetained navigationController];
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v9, 1, 0);
    }
  }
LABEL_7:
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountAutomaticPaymentsHeroViewController;
  [(PKExplanationViewController *)&v7 viewWillLayoutSubviews];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [(PKAccountAutomaticPaymentsHeroViewController *)self view];
  [v4 bounds];
  PKFloatRoundToPixel();
  double v6 = v5;

  [v3 setTopMargin:v6];
}

- (void)setShowSetupPrompt:(BOOL)a3
{
  if (self->_showSetupPrompt != a3)
  {
    self->_showSetupPrompt = a3;
    [(PKAccountAutomaticPaymentsHeroViewController *)self _updateSetupPrompt];
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  if ([(PKAccountAutomaticPaymentsController *)self->_controller needsPreflight])
  {
    [(PKExplanationViewController *)self showSpinner:1];
    objc_initWeak(&location, self);
    controller = self->_controller;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke;
    v6[3] = &unk_1E59CBA18;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [(PKAccountAutomaticPaymentsController *)controller preflightWithCompletion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKAccountAutomaticPaymentsController *)self->_controller presentNextViewControllerFromViewController:self];
  }
}

void __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke_2;
  v8[3] = &unk_1E59CB9F0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  char v12 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v11);
}

void __81__PKAccountAutomaticPaymentsHeroViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    [WeakRetained showSpinner:0];
    if (*(unsigned char *)(a1 + 56)) {
      BOOL v3 = *(void *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 0;
    }
    if (v3)
    {
      [v6[130] presentNextViewControllerFromViewController:*(void *)(a1 + 40)];
    }
    else
    {
      id v4 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:");
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      [v6 presentViewController:v5 animated:1 completion:0];
    }
    id WeakRetained = v6;
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
}

- (void)_updateSetupPrompt
{
  id v10 = [(PKExplanationViewController *)self explanationView];
  BOOL v3 = [v10 dockView];
  id v4 = [v3 footerView];
  [v4 setManualEntryButton:0];

  LODWORD(v4) = self->_showSetupPrompt;
  id v5 = [v3 footerView];
  uint64_t v6 = v5;
  if (v4)
  {
    id v7 = [v5 secondaryActionButton];

    id v8 = PKLocalizedFeatureString();
    [v7 setTitle:v8 forState:0];

    [v7 addTarget:self action:sel__notNowAction_ forControlEvents:64];
    if (PKIsPhone())
    {
      id v9 = [(PKAccountAutomaticPaymentsHeroViewController *)self _autoPayMenuPromptBodyAttributedString];
      [v10 setAttributedBodyText:v9];
    }
  }
  else
  {
    [v5 setSecondaryActionButton:0];

    id v7 = PKLocalizedFeatureString();
    [v10 setBodyText:v7];
  }
}

- (void)_notNowAction:(id)a3
{
}

- (id)_autoPayMenuPromptBodyAttributedString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v3 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
  [v2 setObject:v3 forKey:*MEMORY[0x1E4FB06F8]];
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  [v2 setObject:v4 forKey:*MEMORY[0x1E4FB0700]];

  id v5 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v5 setLineBreakMode:0];
  [v5 setFirstLineHeadIndent:0.0];
  [v2 setObject:v5 forKey:*MEMORY[0x1E4FB0738]];
  id v6 = [NSString alloc];
  id v7 = PKLocalizedFeatureString();
  id v8 = PKLocalizedFeatureString();
  id v9 = (void *)[v6 initWithFormat:@"%@\n\n%@", v7, v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9 attributes:v2];
  id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
  char v12 = [MEMORY[0x1E4FB1618] labelColor];
  v13 = [v11 imageWithTintColor:v12 renderingMode:1];

  v14 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v13];
  v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];
  uint64_t v16 = [v9 rangeOfString:@"%@"];
  if (v17) {
    objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", v16, v17, v15);
  }

  return v10;
}

- (BOOL)showSetupPrompt
{
  return self->_showSetupPrompt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end