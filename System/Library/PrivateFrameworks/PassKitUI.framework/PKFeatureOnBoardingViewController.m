@interface PKFeatureOnBoardingViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKApplyController)applyController;
- (PKFeatureOnBoardingViewController)initWithParentFlowController:(id)a3 setupDelegate:(id)a4 setupContext:(int64_t)a5 onboardingContext:(int64_t)a6 featureIdentifier:(unint64_t)a7 provisioningController:(id)a8 paymentSetupProduct:(id)a9 currentPage:(id)a10;
- (PKPaymentInstallmentConfiguration)installmentConfiguration;
- (id)_analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:(id)a3;
- (id)_appleCardWelcomeExperiment;
- (id)_subjectForFeature:(unint64_t)a3;
- (id)loadHeroImageFromWelcomeExperiment;
- (id)nextOnboardingViewControllerWithPage:(id)a3 product:(id)a4;
- (void)_beginReportingIfNecessary;
- (void)_checkSecurityCapabilities:(unint64_t)a3 nextStep:(id)a4;
- (void)_defaultFeatureAccountAnalyticsWithCompletion:(id)a3;
- (void)_defaultFeatureAccountWithCompletion:(id)a3;
- (void)_endReportingIfNecessary;
- (void)_handleAccountCredential:(id)a3 completion:(id)a4;
- (void)_handleApplyFlowWithCompletion:(id)a3;
- (void)_openSecondaryActionItem;
- (void)_openTermsAndConditions;
- (void)_reportAnalyticsSubject:(id)a3 withPartialEventDictionary:(id)a4;
- (void)_reportAnalyticsViewDidAppear:(BOOL)a3;
- (void)_reportCancelTapped;
- (void)_reportContinueTapped;
- (void)_reportRatesAndTermsTapped;
- (void)didMoveToParentViewController:(id)a3;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidUpdateLayout:(id)a3;
- (void)handleProductAvailable;
- (void)handleSetupLater;
- (void)preflightWithCompletion:(id)a3;
- (void)setApplyController:(id)a3;
- (void)setInstallmentConfiguration:(id)a3;
- (void)updateForHeroImage;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKFeatureOnBoardingViewController

- (PKFeatureOnBoardingViewController)initWithParentFlowController:(id)a3 setupDelegate:(id)a4 setupContext:(int64_t)a5 onboardingContext:(int64_t)a6 featureIdentifier:(unint64_t)a7 provisioningController:(id)a8 paymentSetupProduct:(id)a9 currentPage:(id)a10
{
  id v17 = a10;
  v25.receiver = self;
  v25.super_class = (Class)PKFeatureOnBoardingViewController;
  v18 = [(PKOnBoardingViewController *)&v25 initWithParentFlowController:a3 setupDelegate:a4 context:a5 provisioningController:a8 paymentSetupProduct:a9 currentPage:v17];
  v19 = v18;
  if (v18)
  {
    v18->_featureIdentifier = a7;
    v18->_onboardingContext = a6;
    v20 = [v17 identifier];
    v19->_isMainFeatureOnboardingPage = [v20 isEqualToString:*MEMORY[0x1E4F87468]];

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    defaultFeatureAccountCompletions = v19->_defaultFeatureAccountCompletions;
    v19->_defaultFeatureAccountCompletions = v21;

    if (a7 <= 5)
    {
      char v23 = ((1 << a7) & 0x13) == 0 || v19->_isMainFeatureOnboardingPage;
      v19->_featureSupportsAnalytics = v23;
    }
  }

  return v19;
}

- (void)viewDidLoad
{
  v106.receiver = self;
  v106.super_class = (Class)PKFeatureOnBoardingViewController;
  [(PKOnBoardingViewController *)&v106 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  v96 = [(PKFeatureOnBoardingViewController *)self navigationItem];
  [v96 setHidesBackButton:1];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  v103 = [v4 footerView];
  [v103 setManualEntryButton:0];
  v104 = +[PKApplyController preferredLanguageForFeatureIdentifier:self->_featureIdentifier account:0];
  v5 = [(PKOnBoardingViewController *)self currentPage];
  v100 = [(PKOnBoardingViewController *)self provisioningController];
  v6 = [v100 associatedCredentials];
  v7 = [v6 firstObject];
  int v101 = [v7 isAccountCredential];

  unint64_t v8 = [v5 layout];
  self->_layout = v8;
  if (!v8)
  {
    if (self->_installmentConfiguration) {
      unint64_t v8 = 2;
    }
    else {
      unint64_t v8 = 1;
    }
    self->_layout = v8;
  }
  self->_useCompactLayout = v8 == 2;
  if (self->_isMainFeatureOnboardingPage)
  {
    v9 = +[PKApplyController preferredLanguageForFeatureIdentifier:self->_featureIdentifier account:0];
    switch(self->_featureIdentifier)
    {
      case 0uLL:
      case 3uLL:
        v10 = (void *)MEMORY[0x1E4F83AD0];
        uint64_t v11 = 1;
        goto LABEL_13;
      case 1uLL:
        v10 = (void *)MEMORY[0x1E4F83AD0];
        uint64_t v11 = 2;
        goto LABEL_13;
      case 2uLL:
        v13 = (void *)MEMORY[0x1E4F83AD0];
        uint64_t v14 = 4;
        goto LABEL_58;
      case 4uLL:
        v10 = (void *)MEMORY[0x1E4F83AD0];
        uint64_t v11 = 8;
LABEL_13:
        v15 = objc_msgSend(v10, "pk_privacyLinkForContext:", v11);
        if (v15) {
          goto LABEL_14;
        }
        break;
      case 5uLL:
        v13 = (void *)MEMORY[0x1E4F83AD0];
        uint64_t v14 = 128;
LABEL_58:
        v15 = objc_msgSend(v13, "pk_privacyLinkForContext:", v14);
        [v15 setDisplayLanguage:v9];
        if (!v15) {
          break;
        }
LABEL_14:
        [v3 setShowPrivacyView:1];
        [(PKExplanationViewController *)self setPrivacyLinkController:v15];

        break;
      default:
        break;
    }
    v16 = [(PKFeatureOnBoardingViewController *)self navigationController];
    id v17 = [v16 viewControllers];
    unint64_t v18 = [v17 count];

    if (v18 < 2)
    {
      if (self->_featureIdentifier == 2) {
        [(PKExplanationViewController *)self setShowCancelButton:1];
      }
      else {
        [(PKExplanationViewController *)self setShowCloseButton:1];
      }
    }
    else
    {
      [(PKExplanationViewController *)self setShowCancelButton:0];
      v19 = [(PKFeatureOnBoardingViewController *)self navigationItem];
      [v19 setHidesBackButton:0];
    }
    int v12 = v101;
  }
  else
  {
    [v3 setShowPrivacyView:0];
    [(PKExplanationViewController *)self setShowCancelButton:0];
    int v12 = v101;
  }
  [(PKFeatureOnBoardingViewController *)self updateForHeroImage];
  uint64_t v20 = [v5 title];
  if (v20) {
    char v21 = v12;
  }
  else {
    char v21 = 1;
  }
  v105 = v3;
  v99 = (void *)v20;
  if (v21)
  {
    unint64_t featureIdentifier = self->_featureIdentifier;
    if (featureIdentifier - 4 < 2 || featureIdentifier == 1)
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v29 setNumberStyle:3];
      [v29 setMinimumFractionDigits:2];
      [v29 setMultiplier:&unk_1EF2B92D0];
      v30 = [(PKOnBoardingViewController *)self paymentSetupProduct];
      v31 = [v30 clientInfo];
      v32 = [v31 objectForKey:*MEMORY[0x1E4F87BA0]];

      v33 = [v29 stringFromNumber:v32];
      v34 = PKLocalizedApplyFeatureString();
      objc_msgSend(v3, "setTitleText:", v34, v33);

      [v3 setTitleAccessoriesEnabled:0];
      v35 = [(PKOnBoardingViewController *)self paymentSetupProduct];
      v36 = [v35 clientInfo];
      [v36 objectForKey:*MEMORY[0x1E4F87BF0]];
      v38 = v37 = v4;

      PKSavingsFDICSignageEnabled();
      v39 = [v29 stringFromNumber:v38];
      v40 = PKLocalizedApplyFeatureString();
      objc_msgSend(v105, "setBodyText:", v40, v39);

      v4 = v37;
      v3 = v105;

      int v12 = v101;
    }
    else
    {
      if (featureIdentifier != 2) {
        goto LABEL_36;
      }
      if (self->_useCompactLayout) {
        char v23 = v12;
      }
      else {
        char v23 = 1;
      }
      if (v23)
      {
        [v3 setTitleText:0];
        v24 = PKPassKitUIBundle();
        objc_super v25 = [v24 URLForResource:@"AppleCardLogo" withExtension:@"pdf"];
        double v26 = PKUIScreenScale();
        v27 = PKUIImageFromPDF(v25, 105.0, 31.0, v26);
        v28 = [v27 imageWithRenderingMode:2];

        int v12 = v101;
        [v3 setTitleImage:v28];

        goto LABEL_36;
      }
      PKLocalizedApplyFeatureString();
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      [v3 setTitleText:v29];
    }
  }
  else
  {
    [v3 setTitleText:v20];
    [v3 setTitleAccessoriesEnabled:0];
  }
LABEL_36:
  uint64_t v41 = [v5 subtitle];
  if (v41) {
    char v42 = v12;
  }
  else {
    char v42 = 1;
  }
  v98 = (void *)v41;
  if ((v42 & 1) == 0)
  {
    [v3 setBodyText:v41];
    goto LABEL_50;
  }
  if (!self->_isMainFeatureOnboardingPage) {
    goto LABEL_50;
  }
  if (self->_installmentConfiguration)
  {
    if (v12) {
      v43 = @"INSTALLMENTS_FEATURE_ADD_CARD_EXPLANATION_MESSAGE";
    }
    else {
      v43 = @"INSTALLMENTS_FEATURE_OFFER_EXPLANATION_MESSAGE";
    }
    uint64_t v44 = PKLocalizedBeekmanStringWithLocalization(&v43->isa, v104);
  }
  else
  {
    if (self->_featureIdentifier != 2) {
      goto LABEL_50;
    }
    uint64_t v44 = PKLocalizedApplyFeatureString();
  }
  v45 = (void *)v44;
  [v3 setBodyText:v44];

LABEL_50:
  uint64_t v46 = [v5 body];
  v102 = v5;
  v97 = (void *)v46;
  if (v46)
  {
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v46];
  }
  else if (self->_featureIdentifier == 2)
  {
    if (!self->_isMainFeatureOnboardingPage)
    {
      v47 = 0;
      goto LABEL_75;
    }
    v95 = v4;
    id v48 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v48 setLineBreakMode:0];
    [v48 setAlignment:1];
    [v48 setLineSpacing:10.0];
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v93 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    uint64_t v90 = *MEMORY[0x1E4FB06F8];
    objc_msgSend(v49, "setObject:forKey:");
    v50 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v89 = *MEMORY[0x1E4FB0700];
    objc_msgSend(v49, "setObject:forKey:", v50);

    uint64_t v51 = *MEMORY[0x1E4FB0738];
    v94 = v48;
    [v49 setObject:v48 forKey:*MEMORY[0x1E4FB0738]];
    v52 = [v5 footnote];
    v53 = v52;
    if (v52)
    {
      id v54 = v52;
    }
    else
    {
      PKLocalizedApplyFeatureString();
      id v54 = (id)objc_claimAutoreleasedReturnValue();
    }
    v55 = v54;

    v56 = NSString;
    uint64_t v57 = [v55 length];
    v58 = @"\n";
    if (!v57) {
      v58 = &stru_1EF1B5B50;
    }
    v92 = v55;
    v59 = [v56 stringWithFormat:@"%@%@", v58, v55];
    v91 = v49;
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v59 attributes:v49];
    id v60 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v60 setLineBreakMode:0];
    [v60 setAlignment:1];
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v62 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [v61 setObject:v62 forKey:v90];
    v63 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v61 setObject:v63 forKey:v89];

    [v61 setObject:v60 forKey:v51];
    v64 = [v102 footnoteDisclosure];
    v65 = v64;
    if (v64)
    {
      id v66 = v64;
    }
    else
    {
      PKLocalizedApplyFeatureString();
      id v66 = (id)objc_claimAutoreleasedReturnValue();
    }
    v67 = v66;

    v68 = NSString;
    uint64_t v69 = [v59 length];
    v70 = @"\n";
    if (!v69) {
      v70 = &stru_1EF1B5B50;
    }
    v71 = [v68 stringWithFormat:@"%@%@", v70, v67];
    v72 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v71 attributes:v61];
    [v47 appendAttributedString:v72];

    v4 = v95;
    v5 = v102;
  }
  else
  {
    v47 = 0;
  }
  if (self->_isMainFeatureOnboardingPage
    && self->_featureIdentifier == 5
    && PKSavingsFDICSignageEnabled())
  {
    v73 = [[PKFDICSignageView alloc] initWithFeature:5 displayingBankName:0];
    [v3 setBodyView:v73];

    [v3 setBodyViewPadding:20.0];
  }
LABEL_75:
  [v3 setAttributedSecondaryBodyText:v47];
  v74 = [v5 learnMore];
  v75 = [v74 buttonTitle];
  if (v75) {
    [v3 setBodyButtonText:v75];
  }
  v76 = [v5 disclosureTitle];
  if (v76) {
    [v4 setButtonExplanationText:v76];
  }
  v77 = [v5 primaryActionTitle];
  v78 = v4;
  v79 = [v4 primaryButton];
  v80 = v79;
  if (v77)
  {
    [v79 setTitle:v77 forState:0];
  }
  else
  {
    v81 = PKLocalizedApplyFeatureString();
    [v80 setTitle:v81 forState:0];
  }
  v82 = [v5 secondaryActionItem];
  v83 = [v82 buttonTitle];
  if (v83 || ([v5 secondaryActionTitle], (v83 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v84 = v47;
    [v105 setForceShowSetupLaterButton:1];
    v85 = [v103 setupLaterButton];
    v86 = v85;
    v87 = v83;
  }
  else
  {
    v84 = v47;
    if (!self->_isMainFeatureOnboardingPage || self->_featureIdentifier != 2)
    {
      [v105 setForceShowSetupLaterButton:0];
      goto LABEL_86;
    }
    [v105 setForceShowSetupLaterButton:1];
    v83 = [v103 setupLaterButton];
    v86 = PKLocalizedApplyFeatureString();
    v85 = v83;
    v87 = v86;
  }
  [v85 setTitle:v87 forState:0];

LABEL_86:
  if (self->_isMainFeatureOnboardingPage && self->_featureIdentifier == 2)
  {
    v88 = [(PKFeatureOnBoardingViewController *)self loadHeroImageFromWelcomeExperiment];
    if (v88) {
      [(PKOnBoardingViewController *)self setHeroImage:v88];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKFeatureOnBoardingViewController;
  [(PKFeatureOnBoardingViewController *)&v4 viewDidAppear:a3];
  [(PKFeatureOnBoardingViewController *)self _beginReportingIfNecessary];
  [(PKFeatureOnBoardingViewController *)self _reportAnalyticsViewDidAppear:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKFeatureOnBoardingViewController;
  [(PKFeatureOnBoardingViewController *)&v4 viewDidDisappear:a3];
  [(PKFeatureOnBoardingViewController *)self _reportAnalyticsViewDidAppear:0];
  [(PKFeatureOnBoardingViewController *)self _endReportingIfNecessary];
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKFeatureOnBoardingViewController;
  -[PKFeatureOnBoardingViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (!a3) {
    [(PKFeatureOnBoardingViewController *)self _reportCancelTapped];
  }
}

- (void)updateForHeroImage
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PKOnBoardingViewController *)self currentPage];
  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  objc_super v5 = [(PKOnBoardingViewController *)self heroImage];
  v6 = v5;
  if (self->_useCompactLayout && self->_isMainFeatureOnboardingPage)
  {
    v7 = PKFeatureApplicationHeaderImageWithImage(self->_featureIdentifier, v5);
    [v4 setImage:v7];
    [v4 setTopMargin:30.0];
    unint64_t v8 = PKProvisioningBackgroundColor();
    [v4 setTopBackgroundColor:v8];

    goto LABEL_13;
  }
  if (v5)
  {
    v9 = v4;
    v10 = v6;
LABEL_6:
    [v9 setImage:v10];
    goto LABEL_13;
  }
  uint64_t v11 = [v3 heroImageURL];
  if (v11)
  {
    int v12 = (void *)v11;
    BOOL v13 = [(PKOnBoardingViewController *)self preflightCalled];

    if (!v13)
    {
      v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        unint64_t v18 = v3;
        _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "heroImageURL is set for the current page but we haven't been preflighted: %@", (uint8_t *)&v17, 0xCu);
      }

      v9 = v4;
      v10 = 0;
      goto LABEL_6;
    }
  }
  if (self->_featureIdentifier == 5) {
    PKProvisioningBackgroundColor();
  }
  else {
  uint64_t v14 = PKProvisioningSecondaryBackgroundColor();
  }
  v15 = [[PKApplyHeroCardView alloc] initWithFeatureIdentifier:self->_featureIdentifier];
  [(PKApplyHeroCardView *)v15 setBackgroundColor:v14];
  [v4 setHeroView:v15];
  [v4 setTopBackgroundColor:v14];

LABEL_13:
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  id v4 = a3;
  [(PKFeatureOnBoardingViewController *)self _reportCancelTapped];
  v5.receiver = self;
  v5.super_class = (Class)PKFeatureOnBoardingViewController;
  [(PKOnBoardingViewController *)&v5 explanationViewControllerDidSelectCancel:v4];
}

- (void)explanationViewDidUpdateLayout:(id)a3
{
  id v6 = [(PKExplanationViewController *)self explanationView];
  id v4 = [v6 scrollView];
  objc_super v5 = [(PKFeatureOnBoardingViewController *)self navigationItem];
  objc_msgSend(v4, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v5);
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isMainFeatureOnboardingPage
    && self->_featureIdentifier == 2
    && ([(PKOnBoardingViewController *)self paymentSetupProduct],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        [v5 augmentedProduct],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    PKLogFacilityTypeGetObject();
    unint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:augmentedProduct", "", buf, 2u);
      }
    }

    uint64_t v11 = [(PKFeatureOnBoardingViewController *)self _appleCardWelcomeExperiment];
    int v12 = [(PKFeatureOnBoardingViewController *)self installmentConfiguration];
    BOOL v13 = [v11 experimentDetails];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke;
    v15[3] = &unk_1E59CF368;
    v15[4] = self;
    id v16 = v4;
    [v7 augmentedProductForInstallmentConfiguration:v12 experimentDetails:v13 withCompletion:v15];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PKFeatureOnBoardingViewController;
    [(PKOnBoardingViewController *)&v14 preflightWithCompletion:v4];
  }
}

void __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) product];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) paymentSetupProduct];
    [v3 augmentWithProduct:v2];
    uint64_t v4 = *(void **)(a1 + 40);
    objc_super v5 = [v3 onboardingItems];
    id v6 = [v5 firstObject];
    [v4 setCurrentPage:v6];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  v12.receiver = *(id *)(a1 + 40);
  v12.super_class = (Class)PKFeatureOnBoardingViewController;
  objc_msgSendSuper2(&v12, sel_preflightWithCompletion_, v7);
  PKLogFacilityTypeGetObject();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 40));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_END, v10, "request:augmentedProduct", "", v11, 2u);
    }
  }
}

- (void)_reportAnalyticsViewDidAppear:(BOOL)a3
{
  if (self->_featureSupportsAnalytics)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__PKFeatureOnBoardingViewController__reportAnalyticsViewDidAppear___block_invoke;
    v3[3] = &unk_1E59D55B8;
    BOOL v4 = a3;
    v3[4] = self;
    [(PKFeatureOnBoardingViewController *)self _defaultFeatureAccountAnalyticsWithCompletion:v3];
  }
}

void __67__PKFeatureOnBoardingViewController__reportAnalyticsViewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v9 = objc_alloc_init(v3);
  [v9 addEntriesFromDictionary:v4];

  if (*(unsigned char *)(a1 + 40)) {
    objc_super v5 = (void *)MEMORY[0x1E4F864A0];
  }
  else {
    objc_super v5 = (void *)MEMORY[0x1E4F864A8];
  }
  [v9 setObject:*v5 forKey:*MEMORY[0x1E4F86308]];
  id v6 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v7 = [*(id *)(a1 + 32) _subjectForFeature:*(void *)(*(void *)(a1 + 32) + 1096)];
  id v8 = (void *)[v9 copy];
  [v6 subject:v7 sendEvent:v8];
}

- (void)handleSetupLater
{
  if (self->_isMainFeatureOnboardingPage)
  {
    id v3 = [(PKOnBoardingViewController *)self currentPage];
    id v4 = [v3 secondaryActionItem];

    if (v4) {
      [(PKFeatureOnBoardingViewController *)self _openSecondaryActionItem];
    }
    else {
      [(PKFeatureOnBoardingViewController *)self _openTermsAndConditions];
    }
    [(PKFeatureOnBoardingViewController *)self _reportRatesAndTermsTapped];
  }
  else
  {
    [(PKOnBoardingViewController *)self terminateSetupFlow];
  }
}

- (void)handleProductAvailable
{
  [(PKFeatureOnBoardingViewController *)self _reportContinueTapped];
  [(PKExplanationViewController *)self showNavigationBarSpinner:1];
  id v3 = [(PKOnBoardingViewController *)self provisioningController];
  id v4 = [v3 associatedCredentials];

  objc_super v5 = [v4 firstObject];
  if (self->_onboardingContext == 1
    && [v4 count] == 1
    && [v5 isAccountCredential])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke;
    v7[3] = &unk_1E59CAEA8;
    id v8 = v5;
    id v9 = self;
    [(PKFeatureOnBoardingViewController *)self _checkSecurityCapabilities:58 nextStep:v7];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_3;
    v6[3] = &unk_1E59CB6D8;
    v6[4] = self;
    [(PKFeatureOnBoardingViewController *)self _checkSecurityCapabilities:56 nextStep:v6];
  }
}

void __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) accountCredential];
    id v4 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_2;
    v6[3] = &unk_1E59CA7D0;
    v6[4] = v4;
    [v4 _handleAccountCredential:v3 completion:v6];
  }
  else
  {
    objc_super v5 = *(void **)(a1 + 40);
    [v5 showNavigationBarSpinner:0];
  }
}

uint64_t __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

uint64_t __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_3(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_4;
    v4[3] = &unk_1E59CA7D0;
    v4[4] = v2;
    return [v2 _handleApplyFlowWithCompletion:v4];
  }
  else
  {
    return [v2 showNavigationBarSpinner:0];
  }
}

uint64_t __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (id)nextOnboardingViewControllerWithPage:(id)a3 product:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [PKFeatureOnBoardingViewController alloc];
  id v9 = [(PKOnBoardingViewController *)self parentFlowController];
  os_signpost_id_t v10 = [(PKOnBoardingViewController *)self setupDelegate];
  int64_t v11 = [(PKExplanationViewController *)self context];
  int64_t onboardingContext = self->_onboardingContext;
  unint64_t featureIdentifier = self->_featureIdentifier;
  objc_super v14 = [(PKOnBoardingViewController *)self provisioningController];
  v15 = [(PKFeatureOnBoardingViewController *)v8 initWithParentFlowController:v9 setupDelegate:v10 setupContext:v11 onboardingContext:onboardingContext featureIdentifier:featureIdentifier provisioningController:v14 paymentSetupProduct:v6 currentPage:v7];

  return v15;
}

- (void)_handleAccountCredential:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [PKAccountFlowController alloc];
  id v9 = [(PKOnBoardingViewController *)self provisioningController];
  os_signpost_id_t v10 = [(PKOnBoardingViewController *)self setupDelegate];
  int64_t v11 = [(PKAccountFlowController *)v8 initWithAccountCredential:v7 provisioningController:v9 setupDelegate:v10 context:[(PKExplanationViewController *)self context] operations:63];

  objc_super v12 = [(PKOnBoardingViewController *)self parentFlowController];
  [(PKAccountFlowController *)v11 setParentFlowController:v12];

  BOOL v13 = [(PKFeatureOnBoardingViewController *)self navigationController];
  objc_super v14 = [(PKAccountFlowController *)v11 firstAccountViewController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PKFeatureOnBoardingViewController__handleAccountCredential_completion___block_invoke;
  v16[3] = &unk_1E59CA9F8;
  id v17 = v6;
  id v15 = v6;
  objc_msgSend(v13, "pk_presentPaymentSetupViewController:animated:completion:", v14, 1, v16);
}

uint64_t __73__PKFeatureOnBoardingViewController__handleAccountCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleApplyFlowWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PKOnBoardingViewController *)self provisioningController];
  id v6 = [v5 paymentSetupProductModel];
  id v7 = [v6 productsForFeatureIdentifier:self->_featureIdentifier];

  id v8 = [v7 firstObject];
  id v9 = [v8 featureApplications];
  os_signpost_id_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_108];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_2;
  v15[3] = &unk_1E59D5600;
  id v16 = v10;
  id v17 = self;
  id v18 = v5;
  id v19 = v8;
  id v20 = v4;
  id v11 = v4;
  id v12 = v8;
  id v13 = v5;
  id v14 = v10;
  [(PKFeatureOnBoardingViewController *)self _defaultFeatureAccountWithCompletion:v15];
}

uint64_t __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 lastUpdated];
  id v6 = [v4 lastUpdated];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_super v5 = [v3 lastObject];
  id v6 = [PKApplyControllerConfiguration alloc];
  uint64_t v7 = [*(id *)(a1 + 40) setupDelegate];
  id v8 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:](v6, "initWithSetupDelegate:context:provisioningController:", v7, [*(id *)(a1 + 40) context], *(void *)(a1 + 48));

  [(PKApplyControllerConfiguration *)v8 setFeatureApplication:v5];
  [(PKApplyControllerConfiguration *)v8 setFeature:*(void *)(*(void *)(a1 + 40) + 1096)];
  [(PKApplyControllerConfiguration *)v8 setApplicationType:1];
  id v9 = [[PKApplyController alloc] initWithApplyConfiguration:v8];
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(v10 + 1104);
  *(void *)(v10 + 1104) = v9;

  id v12 = *(void **)(*(void *)(a1 + 40) + 1104);
  id v13 = [MEMORY[0x1E4F841A8] analyticsAccountTypeForAccount:v4];

  [v12 setAnalyticsExistingAccountType:v13];
  [*(id *)(*(void *)(a1 + 40) + 1104) setInstallmentConfiguration:*(void *)(*(void *)(a1 + 40) + 1176)];
  uint64_t v14 = *(void *)(a1 + 40);
  if (*(void *)(v14 + 1096) == 5) {
    [*(id *)(v14 + 1104) setAssociatedIntent:1];
  }
  if (!v5)
  {
    id v15 = [*(id *)(a1 + 56) regionIdentifier];
    if (v15)
    {
      v24 = *(void **)(*(void *)(a1 + 40) + 1104);
      id v16 = [*(id *)(a1 + 48) webService];
      id v17 = [v16 context];
      id v18 = [v17 regions];
      id v19 = [v18 objectForKey:v15];
      id v20 = [v19 applyServiceURL];
      [v24 setApplyServiceURL:v20];
    }
  }
  char v21 = *(void **)(a1 + 40);
  v22 = (void *)v21[138];
  char v23 = [v21 parentFlowController];
  [v22 setParentFlowController:v23];

  id v25 = *(id *)(a1 + 64);
  PKRequestContactAccessWithCompletion();
}

void __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 1104);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_4;
  v3[3] = &unk_1E59CAC08;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 nextViewControllerWithCompletion:v3];
}

void __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) navigationController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_5;
    v12[3] = &unk_1E59CA9F8;
    id v13 = *(id *)(a1 + 40);
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);

    id v7 = v13;
  }
  else
  {
    id v7 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
    id v8 = *(void **)(a1 + 32);
    if (v7)
    {
      id v9 = [v8 navigationController];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_6;
      v10[3] = &unk_1E59CAA98;
      id v11 = *(id *)(a1 + 40);
      [v9 presentViewController:v7 animated:1 completion:v10];
    }
    else
    {
      [v8 terminateSetupFlow];
    }
  }
}

uint64_t __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_checkSecurityCapabilities:(unint64_t)a3 nextStep:(id)a4
{
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Checking security capabilities for feature", buf, 2u);
  }

  id v8 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:a3 feature:self->_featureIdentifier context:[(PKExplanationViewController *)self context]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke;
  v10[3] = &unk_1E59D5628;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(PKSecurityCapabilitiesController *)v8 presentSecurityRepairFlowWithPresentingViewController:self completion:v10];
}

void __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke_2;
  v8[3] = &unk_1E59CD398;
  uint64_t v12 = a2;
  id v9 = v5;
  id v6 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = PKSecurityCapabilitiesErrorToString(*(void *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking security capabilities with upgrade error %@, error %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == 3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  if (!v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_7:
    v6();
    return;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v7 = +[PKAccountFlowController displayableErrorForError:*(void *)(a1 + 32) featureIdentifier:*(void *)(*(void *)(a1 + 40) + 1096) genericErrorTitle:0 genericErrorMessage:0];
  id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
  [*(id *)(a1 + 40) presentViewController:v8 animated:1 completion:0];
}

- (void)_openTermsAndConditions
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Opening feature terms and conditions", v16, 2u);
  }

  if (!self->_applyController)
  {
    uint64_t v4 = [PKApplyControllerConfiguration alloc];
    uint64_t v5 = [(PKOnBoardingViewController *)self setupDelegate];
    int64_t v6 = [(PKExplanationViewController *)self context];
    id v7 = [(PKOnBoardingViewController *)self provisioningController];
    id v8 = [(PKApplyControllerConfiguration *)v4 initWithSetupDelegate:v5 context:v6 provisioningController:v7];

    [(PKApplyControllerConfiguration *)v8 setFeature:self->_featureIdentifier];
    [(PKApplyControllerConfiguration *)v8 setApplicationType:1];
    int v9 = [[PKApplyController alloc] initWithApplyConfiguration:v8];
    applyController = self->_applyController;
    self->_applyController = v9;
  }
  __int16 v11 = [PKApplyTermsAndConditionsViewController alloc];
  uint64_t v12 = self->_applyController;
  uint64_t v13 = [(PKOnBoardingViewController *)self setupDelegate];
  uint64_t v14 = [(PKApplyTermsAndConditionsViewController *)v11 initWithController:v12 setupDelegate:v13 context:[(PKExplanationViewController *)self context] termsIdentifier:0];

  [(PKFeatureTermsAndConditionsViewController *)v14 setUseModalPresentation:1];
  id v15 = [(PKFeatureOnBoardingViewController *)self navigationController];
  objc_msgSend(v15, "pk_presentPaymentSetupViewController:animated:completion:", v14, 1, 0);
}

- (void)_openSecondaryActionItem
{
  id v3 = [(PKOnBoardingViewController *)self currentPage];
  id v10 = [v3 secondaryActionItem];

  if (v10)
  {
    uint64_t v4 = [[PKPaymentMoreInformationViewController alloc] initWithContext:[(PKExplanationViewController *)self context]];
    uint64_t v5 = [v10 title];
    [(PKPaymentMoreInformationViewController *)v4 setDetailTitle:v5];

    int64_t v6 = [v10 subtitle];
    [(PKPaymentMoreInformationViewController *)v4 setDetailSubtitle:v6];

    id v7 = [v10 body];
    [(PKPaymentMoreInformationViewController *)v4 setDetailBody:v7];

    id v8 = [[PKNavigationController alloc] initWithRootViewController:v4];
    int v9 = [(PKFeatureOnBoardingViewController *)self navigationController];
    objc_msgSend(v9, "presentModalViewController:withPaymentSetupContext:", v8, -[PKExplanationViewController context](self, "context"));
  }
}

- (void)_reportContinueTapped
{
  id v4 = [(PKFeatureOnBoardingViewController *)self _analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:*MEMORY[0x1E4F861B8]];
  id v3 = [(PKFeatureOnBoardingViewController *)self _subjectForFeature:self->_featureIdentifier];
  [(PKFeatureOnBoardingViewController *)self _reportAnalyticsSubject:v3 withPartialEventDictionary:v4];

  if (self->_featureIdentifier == 2) {
    [(PKFeatureOnBoardingViewController *)self _reportAnalyticsSubject:*MEMORY[0x1E4F86FF0] withPartialEventDictionary:v4];
  }
}

- (void)_reportCancelTapped
{
  id v4 = [(PKFeatureOnBoardingViewController *)self _analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:*MEMORY[0x1E4F86148]];
  id v3 = [(PKFeatureOnBoardingViewController *)self _subjectForFeature:self->_featureIdentifier];
  [(PKFeatureOnBoardingViewController *)self _reportAnalyticsSubject:v3 withPartialEventDictionary:v4];
}

- (void)_reportRatesAndTermsTapped
{
  id v3 = [(PKFeatureOnBoardingViewController *)self _analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:*MEMORY[0x1E4F86B18]];
  [(PKFeatureOnBoardingViewController *)self _reportAnalyticsSubject:*MEMORY[0x1E4F86FF8] withPartialEventDictionary:v3];
}

- (id)_analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:*MEMORY[0x1E4F86380] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F86120]];

  int64_t v6 = (void *)[v5 copy];

  return v6;
}

- (void)_reportAnalyticsSubject:(id)a3 withPartialEventDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && self->_featureSupportsAnalytics)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__PKFeatureOnBoardingViewController__reportAnalyticsSubject_withPartialEventDictionary___block_invoke;
    v9[3] = &unk_1E59D5650;
    id v10 = v7;
    id v11 = v6;
    [(PKFeatureOnBoardingViewController *)self _defaultFeatureAccountAnalyticsWithCompletion:v9];
  }
}

void __88__PKFeatureOnBoardingViewController__reportAnalyticsSubject_withPartialEventDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithDictionary:*(void *)(a1 + 32)];
  [v5 addEntriesFromDictionary:v4];

  [MEMORY[0x1E4F843E0] subject:*(void *)(a1 + 40) sendEvent:v5];
}

- (void)_defaultFeatureAccountAnalyticsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_featureSupportsAnalytics)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __83__PKFeatureOnBoardingViewController__defaultFeatureAccountAnalyticsWithCompletion___block_invoke;
      v6[3] = &unk_1E59D5678;
      v6[4] = self;
      id v7 = v4;
      [(PKFeatureOnBoardingViewController *)self _defaultFeatureAccountWithCompletion:v6];
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __83__PKFeatureOnBoardingViewController__defaultFeatureAccountAnalyticsWithCompletion___block_invoke(uint64_t a1)
{
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2 = [*(id *)(a1 + 32) installmentConfiguration];
  id v3 = (id *)MEMORY[0x1E4F85F68];
  if (!v2) {
    id v3 = (id *)MEMORY[0x1E4F85F70];
  }
  id v4 = *v3;

  [v18 setObject:v4 forKey:*MEMORY[0x1E4F86730]];
  id v5 = PKFeatureIdentifierToString();
  [v18 setObject:v5 forKey:*MEMORY[0x1E4F864C8]];

  id v6 = [*(id *)(a1 + 32) currentPage];
  id v7 = [v6 identifier];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) currentPage];
    int v9 = [v8 identifier];
    [v18 setObject:v9 forKey:*MEMORY[0x1E4F85F90]];
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 1136);
  if (v10)
  {
    id v11 = [v10 analyticsEventAccountType];
  }
  else
  {
    id v11 = (id)*MEMORY[0x1E4F86320];
  }
  uint64_t v12 = v11;
  if (v11) {
    [v18 setObject:v11 forKey:*MEMORY[0x1E4F86310]];
  }
  uint64_t v13 = [*(id *)(a1 + 32) currentPage];
  [v13 layout];
  uint64_t v14 = PKDynamicProvisioningPageLayoutToString();

  if (v14) {
    [v18 setObject:v14 forKey:*MEMORY[0x1E4F865C0]];
  }
  id v15 = [*(id *)(a1 + 32) provisioningController];
  uint64_t v16 = [v15 referrerIdentifier];

  if (v16) {
    id v17 = (__CFString *)v16;
  }
  else {
    id v17 = @"cid%3Dapy-510-510001";
  }
  [v18 setObject:v17 forKey:*MEMORY[0x1E4F86140]];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_defaultFeatureAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_featureSupportsAnalytics)
    {
      if (!self->_defaultFeatureAccount && !self->_fetchedDefaultFeatureAccount)
      {
        defaultFeatureAccountCompletions = self->_defaultFeatureAccountCompletions;
        id v8 = _Block_copy(v4);
        [(NSMutableArray *)defaultFeatureAccountCompletions addObject:v8];

        int v9 = [MEMORY[0x1E4F84270] sharedInstance];
        unint64_t featureIdentifier = self->_featureIdentifier;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke;
        v11[3] = &unk_1E59CB1C8;
        v11[4] = self;
        [v9 defaultAccountForFeature:featureIdentifier completion:v11];

        goto LABEL_8;
      }
      id v6 = (void (*)(void))v4[2];
    }
    else
    {
      id v6 = (void (*)(void))v4[2];
    }
    v6();
  }
LABEL_8:
}

void __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1136), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 1144) = 1;
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 1160) copy];
  [*(id *)(*(void *)(a1 + 32) + 1160) removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_beginReportingIfNecessary
{
  id v3 = [(PKFeatureOnBoardingViewController *)self _subjectForFeature:self->_featureIdentifier];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v4 = [MEMORY[0x1E4F843E0] reporterForSubject:v3];

    id v3 = v5;
    if (!v4)
    {
      self->_didBeginOnboardingSubject = 1;
      [MEMORY[0x1E4F843E0] beginSubjectReporting:v5];
      id v3 = v5;
    }
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginOnboardingSubject)
  {
    v2 = (void *)MEMORY[0x1E4F843E0];
    id v3 = [(PKFeatureOnBoardingViewController *)self _subjectForFeature:self->_featureIdentifier];
    [v2 endSubjectReporting:v3];
  }
}

- (id)_subjectForFeature:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F86FF8];
LABEL_5:
    id v5 = *v4;
    return v5;
  }
  if (a3 == 5)
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F87018];
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (id)_appleCardWelcomeExperiment
{
  appleCardWelcomeExperiment = self->_appleCardWelcomeExperiment;
  if (!appleCardWelcomeExperiment)
  {
    if (self->_featureIdentifier == 2)
    {
      uint64_t v4 = (PKAppleCardWelcomeExperiment *)objc_alloc_init(MEMORY[0x1E4F84408]);
      id v5 = self->_appleCardWelcomeExperiment;
      self->_appleCardWelcomeExperiment = v4;

      appleCardWelcomeExperiment = self->_appleCardWelcomeExperiment;
    }
    else
    {
      appleCardWelcomeExperiment = 0;
    }
  }
  uint64_t v6 = appleCardWelcomeExperiment;

  return v6;
}

- (id)loadHeroImageFromWelcomeExperiment
{
  uint64_t v3 = [(PKFeatureOnBoardingViewController *)self _appleCardWelcomeExperiment];
  uint64_t v4 = v3;
  if (self->_installmentConfiguration) {
    [v3 heroInstallmentImagePath];
  }
  else {
  id v5 = [v3 heroImagePath];
  }
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] imageWithContentsOfFile:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
}

- (PKApplyController)applyController
{
  return self->_applyController;
}

- (void)setApplyController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_appleCardWelcomeExperiment, 0);
  objc_storeStrong((id *)&self->_defaultFeatureAccountCompletions, 0);
  objc_storeStrong((id *)&self->_defaultFeatureAccount, 0);

  objc_storeStrong((id *)&self->_applyController, 0);
}

@end