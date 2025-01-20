@interface PKPaymentSetupHeroViewController
- (BOOL)_readerModeIsSupported;
- (BOOL)allowsManualEntry;
- (BOOL)hidePrivacyView;
- (BOOL)showChinaPrivacyDisclosure;
- (BOOL)showPaymentCardTitle;
- (BOOL)showSouthKoreaPrivacyDisclosure;
- (PKPaymentHeroImageController)heroImageController;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupHeroViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 product:(id)a6 allowsManualEntry:(BOOL)a7;
- (PKPaymentSetupHeroViewControllerFlowDelegate)flowDelegate;
- (PKPaymentSetupViewControllerDelegate)delegate;
- (PKPaymentWebService)webService;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)_bodyText;
- (int64_t)paymentSetupMode;
- (void)_configureDock;
- (void)_preflightWithCompletion:(id)a3;
- (void)_setShowActivityIndicator:(BOOL)a3;
- (void)_setUserInteractionEnabled:(BOOL)a3;
- (void)_terminateSetupFlow;
- (void)_transferExistingCardTapped;
- (void)didTapFooterLink:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)setAllowsManualEntry:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFeaturedHeroImages:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setHidePrivacyView:(BOOL)a3;
- (void)setHideSetupLaterButton:(BOOL)a3;
- (void)setPaymentSetupMode:(int64_t)a3;
- (void)setReporter:(id)a3;
- (void)setShowChinaPrivacyDisclosure:(BOOL)a3;
- (void)setShowPaymentCardTitle:(BOOL)a3;
- (void)setShowSouthKoreaPrivacyDisclosure:(BOOL)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentSetupHeroViewController

- (PKPaymentSetupHeroViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 product:(id)a6 allowsManualEntry:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentSetupHeroViewController;
  v16 = [(PKExplanationViewController *)&v32 initWithContext:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_provisioningController, a3);
    v18 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v17->_accountStore;
    v17->_accountStore = v18;

    objc_storeWeak((id *)&v17->_delegate, v14);
    v17->_allowsManualEntry = a7;
    v17->_paymentSetupMode = 0;
    objc_storeStrong((id *)&v17->_product, a6);
    v20 = [(PKPaymentSetupHeroViewController *)v17 webService];
    v21 = [v20 targetDevice];
    uint64_t v22 = [v21 deviceRegion];
    deviceRegion = v17->_deviceRegion;
    v17->_deviceRegion = (NSString *)v22;

    v24 = [MEMORY[0x1E4F84AC8] manifestForRegion:v17->_deviceRegion];
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F84AC0]) initWithManifest:v24 webService:v20];
    heroImageController = v17->_heroImageController;
    v17->_heroImageController = (PKPaymentHeroImageController *)v25;

    [(PKExplanationViewController *)v17 context];
    if (PKPaymentSetupContextIsBridge()) {
      [(PKPaymentHeroImageController *)v17->_heroImageController setWatchSize:+[PKBridgeWatchAttributeController heroWatchSize]];
    }
    v27 = [(PKExplanationViewController *)v17 explanationView];
    if (v17->_showPaymentCardTitle) {
      PKLocalizedPaymentString(&cfstr_PaymentSetupCr.isa);
    }
    else {
    v28 = [(PKPaymentSetupProduct *)v17->_product displayName];
    }
    [v27 setTitleText:v28];

    [v27 setTitleAccessoriesEnabled:0];
    [v27 setDelegate:v17];
    char v29 = objc_opt_respondsToSelector();
    char v30 = 0;
    if (v29) {
      char v30 = [v21 felicaSecureElementIsAvailable];
    }
    v17->_hasFelicaSecureElement = v30;
  }
  return v17;
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupHeroViewController;
  [(PKExplanationViewController *)&v15 loadView];
  [(PKPaymentSetupHeroViewController *)self _configureDock];
  int64_t v3 = [(PKExplanationViewController *)self context];
  featuredImages = self->_featuredImages;
  if (featuredImages && [(NSArray *)featuredImages count])
  {
    v5 = self->_featuredImages;
  }
  else
  {
    v6 = [(PKPaymentHeroImageController *)self->_heroImageController featuredImages];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [(PKPaymentHeroImageController *)self->_heroImageController featuredDefaultImages];
    }
    v5 = v8;
  }
  v9 = [(PKPaymentHeroImageController *)self->_heroImageController filterImages:v5];

  v10 = [[PKPaymentSetupHeroView alloc] initWithContext:v3 heroImageController:self->_heroImageController heroImages:v9 product:self->_product];
  splashView = self->_splashView;
  self->_splashView = v10;

  v12 = [(PKExplanationViewController *)self explanationView];
  [v12 setHeroView:self->_splashView];
  if ((PKPearlIsAvailable() & 1) != 0
    || [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    id v13 = +[PKPaymentSetupHeroView assetBackgroundColor];
    [v12 setTopBackgroundColor:v13];
  }
  id v14 = [(PKPaymentSetupHeroViewController *)self view];
  [v14 setAccessibilityIdentifier:*MEMORY[0x1E4F859D8]];
}

- (void)_configureDock
{
  v42[1] = *MEMORY[0x1E4F143B8];
  v37 = [(PKExplanationViewController *)self explanationView];
  [(PKExplanationViewController *)self context];
  uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  v4 = [v37 dockView];
  v38 = [v4 footerView];
  [v4 setRequiresAdditionalPrimaryButtonPadding:IsSetupAssistant];
  [v38 setManualEntryButton:0];
  if (IsSetupAssistant) {
    [v38 setSkipCardButton:0];
  }
  if (self->_allowsManualEntry
    && [(PKPaymentSetupHeroViewController *)self _readerModeIsSupported])
  {
    if (self->_showSouthKoreaPrivacyDisclosure) {
      v5 = @"SETUP_PURCHASE_TRANSFER_BALANCE_MESSAGE_SOUTH_KOREA";
    }
    else {
      v5 = @"SETUP_PURCHASE_TRANSFER_BALANCE_MESSAGE";
    }
    v6 = PKLocalizedPaymentString(&v5->isa);
    v7 = [v38 secondaryActionButton];
    [v7 setTitle:v6 forState:0];
    [v7 addTarget:self action:sel__transferExistingCardTapped forControlEvents:0x2000];
  }
  product = self->_product;
  if (product)
  {
    v9 = [(PKPaymentSetupProduct *)product configuration];
    uint64_t v10 = [v9 type];

    unint64_t v11 = v10 - 3;
  }
  else
  {
    unint64_t v11 = -3;
  }
  if (self->_hidePrivacyView) {
    [(PKExplanationViewController *)self setPrivacyLinkController:0];
  }
  if (v11 < 2)
  {
    uint64_t v12 = 8;
LABEL_19:
    objc_super v15 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", v12);
    [(PKExplanationViewController *)self setPrivacyLinkController:v15];

    goto LABEL_20;
  }
  if ((PKPaymentSetupContextIsNonExpressSetupAssistant() & 1) != 0
    || ([(PKPaymentProvisioningController *)self->_provisioningController associatedCredentials],
        id v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 count],
        v13,
        v14))
  {
    uint64_t v12 = 255;
    goto LABEL_19;
  }
  if (PKPaymentSetupContextIsIssuerApp())
  {
    uint64_t v12 = 9;
    goto LABEL_19;
  }
LABEL_20:
  if (self->_showChinaPrivacyDisclosure)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v16 setLineBreakMode:0];
    [v16 setAlignment:1];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [v17 setObject:v18 forKey:*MEMORY[0x1E4FB06F8]];
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v17 setObject:v19 forKey:*MEMORY[0x1E4FB0700]];

    [v17 setObject:v16 forKey:*MEMORY[0x1E4FB0738]];
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    v21 = PKLocalizedPaymentString(&cfstr_ApplePayDescri.isa);
    uint64_t v22 = (void *)[v20 initWithString:v21 attributes:v17];

    [v37 setAttributedSecondaryBodyText:v22];
  }
  v23 = self->_product;
  int v24 = PKIsChinaSKU();
  if (self->_showSouthKoreaPrivacyDisclosure)
  {
    uint64_t v25 = PKLocalizedPaymentString(&cfstr_ContinueSouthK.isa);
    v26 = [v4 primaryButton];
    [v26 setTitle:v25 forState:0];

    v27 = PKLocalizedPaymentString(&cfstr_HeroSouthKorea.isa);
    v28 = PKLocalizedPaymentString(&cfstr_HeroSouthKorea_0.isa);
    char v29 = PKStringWithValidatedFormat();
    char v30 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setTextAlignment:](v30, "setTextAlignment:", 1, v28);
    [(PKMultiHyperlinkView *)v30 setText:v29];
    objc_initWeak(&location, self);
    v31 = [PKTextRangeHyperlink alloc];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __50__PKPaymentSetupHeroViewController__configureDock__block_invoke;
    v39[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v40, &location);
    objc_super v32 = [(PKTextRangeHyperlink *)v31 initWithLinkText:v28 action:v39];
    v42[0] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [(PKMultiHyperlinkView *)v30 setSources:v33];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    [v4 setAdditionalLinkView:v30];
    [v4 setAdditionalLinkBottomPadding:11.0];
  }
  else
  {
    if (v23) {
      int v34 = 0;
    }
    else {
      int v34 = v24;
    }
    if (v34 == 1)
    {
      v35 = PKLocalizedPaymentString(&cfstr_ContinueChina.isa);
      v36 = [v4 primaryButton];
      [v36 setTitle:v35 forState:0];
    }
  }
  if ([(PKExplanationViewController *)self showCancelButton]) {
    [(PKExplanationViewController *)self setShowCancelButton:0];
  }
}

void __50__PKPaymentSetupHeroViewController__configureDock__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F87090]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapFooterLink:v3];
}

- (BOOL)_readerModeIsSupported
{
  if (!self->_product || ![MEMORY[0x1E4F845F0] isSupported]) {
    return 0;
  }
  id v3 = [(PKPaymentSetupProduct *)self->_product provisioningMethodMetadataForType:*MEMORY[0x1E4F87AA0]];
  if (v3) {
    BOOL v4 = ([(PKPaymentSetupProduct *)self->_product allSupportedProtocols] & 4) == 0
  }
      || PKFelicaSecureElementIsAvailable() != 0;
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupHeroViewController;
  [(PKPaymentSetupHeroViewController *)&v5 viewWillAppear:a3];
  [(PKPaymentSetupHeroViewController *)self _setUserInteractionEnabled:1];
  if (!self->_preflightComplete)
  {
    [(PKExplanationViewController *)self context];
    if (PKPaymentSetupContextIsMerchantApp())
    {
      [(PKPaymentSetupHeroViewController *)self _setShowActivityIndicator:1];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __51__PKPaymentSetupHeroViewController_viewWillAppear___block_invoke;
      v4[3] = &unk_1E59CB6D8;
      v4[4] = self;
      [(PKPaymentSetupHeroViewController *)self _preflightWithCompletion:v4];
    }
  }
}

uint64_t __51__PKPaymentSetupHeroViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setShowActivityIndicator:0];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupHeroViewController;
  [(PKExplanationViewController *)&v7 viewDidLoad];
  id v3 = [(PKPaymentSetupHeroViewController *)self view];
  BOOL v4 = [(PKExplanationViewController *)self explanationView];
  objc_super v5 = [(PKPaymentSetupHeroViewController *)self _bodyText];
  [v4 setBodyText:v5];

  v6 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v6];

  PKPaymentSetupApplyContextAppearance([(PKExplanationViewController *)self context], v3);
}

- (void)_preflightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_preflightComplete)
  {
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    PKTimeProfileBegin();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59CA9F8;
    id v14 = v5;
    v6 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    provisioningController = self->_provisioningController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_2;
    v9[3] = &unk_1E59DE9D0;
    objc_copyWeak(&v11, &location);
    v9[4] = self;
    id v8 = v6;
    id v10 = v8;
    [(PKPaymentProvisioningController *)provisioningController preflightWithRequirements:165 completionRequirements:165 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

uint64_t __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  id v3 = (id)PKTimeProfileEnd();

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    objc_super v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1065) = 1;
    if (v4)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_3;
      v8[3] = &unk_1E59CA7D0;
      v8[4] = *(void *)(a1 + 32);
      id v7 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v8, 0);
      if (v7) {
        [v6 presentViewController:v7 animated:1 completion:0];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 explanationView];
  [v1 explanationViewDidSelectSetupLater:v2];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupHeroViewController;
  [(PKExplanationViewController *)&v9 viewWillLayoutSubviews];
  [(PKExplanationViewController *)self context];
  double v3 = 0.0;
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    id v4 = [(PKPaymentSetupHeroViewController *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      v6 = [MEMORY[0x1E4FB16C8] currentDevice];
      unint64_t v7 = [v6 orientation] - 1;

      if (v7 > 1) {
        goto LABEL_9;
      }
    }
    else if (v5 != 5)
    {
      if (v5 == 6) {
        double v3 = 74.0;
      }
      else {
        double v3 = 0.0;
      }
      goto LABEL_9;
    }
    double v3 = 54.0;
  }
LABEL_9:
  id v8 = [(PKExplanationViewController *)self explanationView];
  [v8 setTopMargin:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupHeroViewController;
  [(PKPaymentSetupHeroViewController *)&v8 viewDidAppear:a3];
  self->_nextButtonPushed = 0;
  splashView = self->_splashView;
  if (splashView) {
    [(PKPaymentSetupHeroView *)splashView startAnimation];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 viewControllerDidBeginSetupFlow:self];
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupHeroViewController;
  [(PKPaymentSetupHeroViewController *)&v7 viewDidDisappear:a3];
  id v4 = [(PKPaymentSetupHeroViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v6 = [(PKPaymentSetupHeroViewController *)self view];
    [v6 stopAnimation];
  }
}

- (PKPaymentWebService)webService
{
  return (PKPaymentWebService *)[(PKPaymentProvisioningController *)self->_provisioningController webService];
}

- (void)setFeaturedHeroImages:(id)a3
{
}

- (void)_setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKPaymentSetupHeroViewController *)self view];
  [v5 setUserInteractionEnabled:v3];

  [(PKPaymentSetupHeroViewController *)self _setShowActivityIndicator:v3 ^ 1];
}

- (void)_setShowActivityIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKExplanationViewController *)self explanationView];
  id v6 = [v4 dockView];

  [v6 setButtonsEnabled:v3 ^ 1];
  uint64_t v5 = [v6 primaryButton];
  [v5 setShowSpinner:v3];
}

- (id)_bodyText
{
  BOOL v3 = [(PKPaymentSetupProduct *)self->_product longLocalizedDescription];
  if ([v3 length])
  {
    id v4 = v3;
    goto LABEL_19;
  }
  uint64_t v5 = [(PKPaymentSetupHeroViewController *)self webService];
  id v6 = [v5 context];
  objc_super v7 = [v6 configuration];

  objc_super v8 = [v7 paymentSetupFeaturedNetworksForRegion:self->_deviceRegion];
  [(PKExplanationViewController *)self context];
  int IsBridge = PKPaymentSetupContextIsBridge();
  id v10 = [(PKPaymentSetupHeroViewController *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFBLL;
  if (![v8 containsObject:*MEMORY[0x1E4F87A18]] || !self->_hasFelicaSecureElement || v12)
  {
    if ([v8 containsObject:*MEMORY[0x1E4F87A08]]) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      uint64_t v13 = PKLocalizedAquamanString(&cfstr_ApplePayDescri_1.isa);
      goto LABEL_14;
    }
    objc_super v15 = PKPeerPaymentServiceOverrideURL();
    if (v15)
    {
    }
    else if (([v7 peerPaymentEnabledForRegion:self->_deviceRegion] & 1) == 0)
    {
      if (PKDeviceRegionSupportsDebit())
      {
        if ([(NSString *)self->_deviceRegion isEqualToString:@"HK"]
          || [(NSString *)self->_deviceRegion isEqualToString:@"CN"])
        {
          id v16 = @"APPLE_PAY_DESCRIPTION_NO_STORE";
        }
        else
        {
          id v16 = @"APPLE_PAY_DESCRIPTION";
        }
      }
      else
      {
        id v16 = @"APPLE_PAY_DESCRIPTION_NO_DEBIT";
      }
      goto LABEL_17;
    }
    id v16 = @"APPLE_PAY_DESCRIPTION_SURF";
LABEL_17:
    PKDeviceSpecificLocalizedStringKeyForKey(v16, IsBridge);
    id v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v17);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  uint64_t v13 = PKLocalizedPaymentString(&cfstr_ApplePayDescri_0.isa);
LABEL_14:
  id v4 = (id)v13;
LABEL_18:

LABEL_19:

  return v4;
}

- (void)_terminateSetupFlow
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    [(PKPaymentSetupHeroViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)didTapFooterLink:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v4];
    [v5 setModalPresentationStyle:2];
    [(PKPaymentSetupHeroViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      objc_super v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Error: Could not open url in: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_transferExistingCardTapped
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportOtherButtonPressed:@"transferCard"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained heroViewControllerDidRequestTransferBalance:self];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [v6 heroViewControllerDidSelectContinue:self];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: explanationViewDidSelectContinue called for hero view, but it should have been overridden", buf, 2u);
    }

    [(PKPaymentSetupHeroViewController *)self _terminateSetupFlow];
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [v5 heroViewControllerDidSelectSetupLater:self];
  }
  else
  {
    [(PKPaymentSetupHeroViewController *)self _terminateSetupFlow];
  }
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(PKExplanationViewController *)self explanationView];
  id v4 = [v7 dockView];
  id v5 = [v4 footerView];
  id v6 = v5;
  if (v3) {
    [v5 setSetupLaterButton:0];
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
}

- (PKPaymentSetupHeroViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupHeroViewControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentHeroImageController)heroImageController
{
  return self->_heroImageController;
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (int64_t)paymentSetupMode
{
  return self->_paymentSetupMode;
}

- (void)setPaymentSetupMode:(int64_t)a3
{
  self->_paymentSetupMode = a3;
}

- (BOOL)showPaymentCardTitle
{
  return self->_showPaymentCardTitle;
}

- (void)setShowPaymentCardTitle:(BOOL)a3
{
  self->_showPaymentCardTitle = a3;
}

- (BOOL)hidePrivacyView
{
  return self->_hidePrivacyView;
}

- (void)setHidePrivacyView:(BOOL)a3
{
  self->_hidePrivacyView = a3;
}

- (BOOL)showChinaPrivacyDisclosure
{
  return self->_showChinaPrivacyDisclosure;
}

- (void)setShowChinaPrivacyDisclosure:(BOOL)a3
{
  self->_showChinaPrivacyDisclosure = a3;
}

- (BOOL)showSouthKoreaPrivacyDisclosure
{
  return self->_showSouthKoreaPrivacyDisclosure;
}

- (void)setShowSouthKoreaPrivacyDisclosure:(BOOL)a3
{
  self->_showSouthKoreaPrivacyDisclosure = a3;
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_heroImageController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_featuredImages, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_splashView, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end