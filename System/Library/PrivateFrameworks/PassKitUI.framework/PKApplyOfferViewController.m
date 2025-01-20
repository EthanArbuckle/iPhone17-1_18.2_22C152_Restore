@interface PKApplyOfferViewController
- (PKApplyOfferViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6;
- (UIImage)heroImage;
- (id)analyticsAdditionalValues;
- (id)analyticsPageTag;
- (void)_openTermsAndConditions;
- (void)_setupForBroadwayApplication:(id)a3;
- (void)_terminateApplyFlowWithoutDeclining;
- (void)_termsAccepted:(BOOL)a3 actionIdentifier:(id)a4;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setHeroImage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKApplyOfferViewController

- (PKApplyOfferViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKApplyOfferViewController;
  v11 = [(PKApplyExplanationViewController *)&v22 initWithController:v10 setupDelegate:a4 context:a5 applyPage:a6];
  if (v11)
  {
    v12 = [v10 featureApplication];
    v13 = [v12 applicationOfferDetails];

    v14 = [v13 detailsInfo];
    uint64_t v15 = [v13 offerTermsIdentifier];
    offerTermsIdentifier = v11->_offerTermsIdentifier;
    v11->_offerTermsIdentifier = (NSString *)v15;

    uint64_t v17 = [v10 installmentConfiguration];
    installmentConfiguration = v11->_installmentConfiguration;
    v11->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v17;

    if ([v14 layout])
    {
      uint64_t v19 = [v14 layout];
    }
    else if (v11->_installmentConfiguration)
    {
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v19 = 1;
    }
    v11->_layout = v19;
    v20 = [v10 featureApplication];
    v11->_hasSufficientOTBForInstallment = [v20 hasSufficientOTBForInstallmentConfiguration:v11->_installmentConfiguration];
  }
  return v11;
}

- (void)dealloc
{
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKApplyOfferViewController;
  [(PKApplyOfferViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKApplyOfferViewController;
  [(PKApplyExplanationViewController *)&v8 viewDidLoad];
  v3 = [(PKApplyExplanationViewController *)self controller];
  v4 = [v3 featureApplication];

  unint64_t v5 = [v4 feature];
  if (v5 <= 5)
  {
    if (v5 == 2)
    {
      [(PKApplyOfferViewController *)self _setupForBroadwayApplication:v4];
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Error: Unsupported feature cannot present UI", v7, 2u);
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyOfferViewController;
  [(PKApplyExplanationViewController *)&v5 viewDidAppear:a3];
  v4 = [(PKApplyExplanationViewController *)self controller];
  [v4 termsShownWithIdentifier:self->_offerTermsIdentifier];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyOfferViewController;
  [(PKApplyOfferViewController *)&v6 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    objc_super v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (void (**)(void, void))v4;
  if (self->_heroImage)
  {
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    objc_super v6 = [(PKApplyExplanationViewController *)self currentPage];
    v7 = [v6 heroImageURL];

    if (v7)
    {
      objc_super v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
      v9 = PKLogFacilityTypeGetObject();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKApplyOfferViewController preflighting", buf, 2u);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke;
        aBlock[3] = &unk_1E59D2B70;
        aBlock[4] = self;
        id v19 = v7;
        v20 = v5;
        v11 = (void (**)(void *, void *))_Block_copy(aBlock);
        v12 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
        v13 = [v12 cachedDataForURL:v8];

        if (v13)
        {
          v11[2](v11, v13);
        }
        else
        {
          uint64_t v15 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_2;
          v16[3] = &unk_1E59CE028;
          uint64_t v17 = v11;
          [v15 downloadFromUrl:v8 completionHandler:v16];
        }
      }
      else
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          objc_super v22 = v7;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Could not create valid URL for :%@", buf, 0xCu);
        }

        if (v5) {
          v5[2](v5, 1);
        }
      }
    }
    else
    {
      v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKApplyOfferViewController - nothing to preflight", buf, 2u);
      }

      if (v5) {
        v5[2](v5, 1);
      }
    }
  }
}

void __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] imageWithData:v3];
    uint64_t v5 = a1[4];
    objc_super v6 = *(void **)(v5 + 1240);
    *(void *)(v5 + 1240) = v4;

    uint64_t v7 = *(void *)(a1[4] + 1240);
    objc_super v8 = PKLogFacilityTypeGetObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        uint64_t v10 = a1[5];
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v10;
        v11 = "Created image for URL: %{public}@";
LABEL_7:
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else if (v9)
    {
      uint64_t v12 = a1[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v12;
      v11 = "Failed to create image for URL: %{public}@";
      goto LABEL_7;
    }
  }
  v13 = (void *)a1[6];
  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_19;
    block[3] = &unk_1E59CAA98;
    id v15 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__PKApplyOfferViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Offer terms accepted", v16, 2u);
  }

  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v17[0] = *MEMORY[0x1E4F86308];
  v17[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86020];
  v18[0] = *MEMORY[0x1E4F86380];
  v18[1] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  BOOL v9 = (void *)[v5 initWithDictionary:v8];

  uint64_t v10 = [(PKApplyOfferViewController *)self analyticsAdditionalValues];
  [v9 addEntriesFromDictionary:v10];

  v11 = [(PKApplyExplanationViewController *)self controller];
  uint64_t v12 = [(PKApplyExplanationViewController *)self currentPage];
  v13 = [(PKApplyOfferViewController *)self analyticsPageTag];
  [v11 reportAnalyticsDictionaryForPage:v12 pageTag:v13 additionalValues:v9];

  v14 = [(PKApplyExplanationViewController *)self currentPage];
  id v15 = [v14 primaryActionIdentifier];
  [(PKApplyOfferViewController *)self _termsAccepted:1 actionIdentifier:v15];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = *MEMORY[0x1E4F86120];
  v19[0] = *MEMORY[0x1E4F86308];
  v19[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F86110];
  v20[0] = *MEMORY[0x1E4F86380];
  v20[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  objc_super v8 = (void *)[v4 initWithDictionary:v7];

  BOOL v9 = [(PKApplyOfferViewController *)self analyticsAdditionalValues];
  [v8 addEntriesFromDictionary:v9];

  uint64_t v10 = [(PKApplyExplanationViewController *)self controller];
  v11 = [(PKApplyExplanationViewController *)self currentPage];
  uint64_t v12 = [(PKApplyOfferViewController *)self analyticsPageTag];
  [v10 reportAnalyticsDictionaryForPage:v11 pageTag:v12 additionalValues:v8];

  installmentConfiguration = self->_installmentConfiguration;
  v14 = PKLogFacilityTypeGetObject();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (installmentConfiguration)
  {
    if (v15)
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Dismissing installment apply without declining", v18, 2u);
    }

    [(PKApplyOfferViewController *)self _terminateApplyFlowWithoutDeclining];
  }
  else
  {
    if (v15)
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Offer terms declined", v18, 2u);
    }

    v16 = [(PKApplyExplanationViewController *)self currentPage];
    uint64_t v17 = [v16 secondaryActionIdentifier];
    [(PKApplyOfferViewController *)self _termsAccepted:0 actionIdentifier:v17];
  }
}

- (id)analyticsPageTag
{
  if (self->_installmentConfiguration) {
    v2 = (id *)MEMORY[0x1E4F85F80];
  }
  else {
    v2 = (id *)MEMORY[0x1E4F85F88];
  }
  return *v2;
}

- (id)analyticsAdditionalValues
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = PKFeatureApplicationOfferDetailsInfoLayoutToString();
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F865C0]];

  id v4 = (void *)[v2 copy];

  return v4;
}

- (void)_setupForBroadwayApplication:(id)a3
{
  id v4 = a3;
  v56 = [(PKApplyExplanationViewController *)self currentPage];
  uint64_t v5 = [(PKExplanationViewController *)self explanationView];
  uint64_t v6 = [v4 feature];
  uint64_t v7 = [v4 applicationOfferDetails];
  v58 = [v7 detailsInfo];
  objc_super v8 = [(PKApplyExplanationViewController *)self controller];
  v59 = [v8 preferredLanguage];

  BOOL v9 = [(PKApplyOfferViewController *)self heroImage];
  uint64_t v10 = [v4 applicationType];
  BOOL v11 = self->_layout == 2 || v10 == 2;
  v52 = v9;
  if (v11)
  {
    uint64_t v12 = PKFeatureApplicationHeaderImageWithImage(v6, v9);
    [v5 setImage:v12];
    [v5 setTopMargin:30.0];
  }
  else
  {
    if (v9)
    {
      [v5 setImage:v9];
      goto LABEL_11;
    }
    uint64_t v12 = PKProvisioningSecondaryBackgroundColor();
    [v5 setTopBackgroundColor:v12];
    v13 = [[PKApplyHeroCardView alloc] initWithFeatureIdentifier:v6];
    [(PKApplyHeroCardView *)v13 setBackgroundColor:v12];
    [v5 setHeroView:v13];
  }
LABEL_11:
  v14 = [v7 aprForPurchase];
  if (v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v15 setNumberStyle:3];
    if ((objc_msgSend(v14, "pk_isIntegralNumber") & 1) == 0) {
      [v15 setMinimumFractionDigits:2];
    }
    v53 = [v15 stringFromNumber:v14];
  }
  else
  {
    v53 = @"-";
  }
  objc_initWeak(location, self);
  v16 = (void *)MEMORY[0x1E4FB13F0];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __59__PKApplyOfferViewController__setupForBroadwayApplication___block_invoke;
  v60[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v61, location);
  v57 = [v16 actionWithHandler:v60];
  uint64_t v17 = [v58 disclosureTitle];
  uint64_t v18 = v17;
  if (v17)
  {
    id v55 = v17;
  }
  else
  {
    PKLocalizedApplyFeatureString();
    id v55 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v19 = [[PKApplyOfferCreditCardView alloc] initWithTermsLinkAction:v57 actionTitle:v55];
  offerView = self->_offerView;
  self->_offerView = v19;

  v54 = [v56 body];
  if (self->_layout != 2)
  {
    v21 = [v7 currencyCode];
    v49 = PKMutableNumberFormatterForCurrencyCode();
    uint64_t v47 = [v49 minimumFractionDigits];
    objc_super v22 = [(PKApplyOfferCreditCardView *)self->_offerView creditLimitTitleLabel];
    uint64_t v23 = PKLocalizedApplyFeatureString();
    [v22 setText:v23];

    v51 = [v7 creditLimit];
    v50 = @"-";
    if (v21 && v51)
    {
      if (objc_msgSend(v51, "pk_isIntegralNumber")) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = v47;
      }
      [v49 setMinimumFractionDigits:v24];
      v50 = [v49 stringFromNumber:v51];
    }
    v25 = [(PKApplyOfferCreditCardView *)self->_offerView creditLimitLabel];
    [v25 setText:v50];

    v26 = [(PKApplyOfferCreditCardView *)self->_offerView aprForPurchaseTitleLabel];
    v27 = PKLocalizedApplyFeatureString();
    [v26 setText:v27];

    v28 = [(PKApplyOfferCreditCardView *)self->_offerView aprForPurchaseLabel];
    [v28 setText:v53];

    unint64_t v29 = [v4 applicationType];
    if (v29 < 2)
    {
      v33 = [(PKApplyOfferCreditCardView *)self->_offerView feeTitleLabel];
      v34 = PKLocalizedApplyFeatureString();
      [v33 setText:v34];
      v48 = v21;

      v35 = [v7 annualFee];
      v36 = [MEMORY[0x1E4F28C28] zero];
      int v37 = [v35 isEqualToNumber:v36];

      if (v37)
      {
        PKLocalizedApplyFeatureString();
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = @"-";
        if (v48 && v35)
        {
          v39 = PKMutableNumberFormatterForCurrencyCode();
          if (objc_msgSend(v35, "pk_isIntegralNumber")) {
            uint64_t v40 = 0;
          }
          else {
            uint64_t v40 = v47;
          }
          [v39 setMinimumFractionDigits:v40];
          v38 = [v39 stringFromNumber:v35];
        }
      }
      v41 = [(PKApplyOfferCreditCardView *)self->_offerView feeLabel];
      [v41 setText:v38];
    }
    else
    {
      if (v29 - 2 > 1)
      {
LABEL_42:

        goto LABEL_43;
      }
      v30 = [v7 balance];
      v31 = v30;
      if (v30)
      {
        v32 = v30;
      }
      else
      {
        v32 = [MEMORY[0x1E4F28C28] zero];
      }
      v38 = v32;

      v42 = [(PKApplyOfferCreditCardView *)self->_offerView feeTitleLabel];
      v43 = PKLocalizedApplyFeatureString();
      [v42 setText:v43];
      v48 = v21;

      v44 = [v7 currencyCode];
      v45 = PKCurrencyAmountMake();
      v35 = [v45 formattedStringValue];

      v41 = [(PKApplyOfferCreditCardView *)self->_offerView feeLabel];
      [v41 setText:v35];
    }

    v21 = v48;
    goto LABEL_42;
  }
LABEL_43:
  v46 = [(PKApplyOfferCreditCardView *)self->_offerView bodyLabel];
  [v46 setText:v54];

  [v5 setBodyView:self->_offerView];
  objc_destroyWeak(&v61);
  objc_destroyWeak(location);
}

void __59__PKApplyOfferViewController__setupForBroadwayApplication___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openTermsAndConditions];
}

- (void)_openTermsAndConditions
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = *MEMORY[0x1E4F86BB0];
  v19[0] = *MEMORY[0x1E4F86308];
  v19[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F86D20];
  v20[0] = *MEMORY[0x1E4F86468];
  v20[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v7 = (void *)[v3 initWithDictionary:v6];

  objc_super v8 = [(PKApplyOfferViewController *)self analyticsAdditionalValues];
  [v7 addEntriesFromDictionary:v8];

  BOOL v9 = [(PKApplyExplanationViewController *)self controller];
  uint64_t v10 = [(PKApplyExplanationViewController *)self currentPage];
  BOOL v11 = [(PKApplyOfferViewController *)self analyticsPageTag];
  [v9 reportAnalyticsDictionaryForPage:v10 pageTag:v11 additionalValues:v7];

  uint64_t v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Opening offer terms and conditions", v18, 2u);
  }

  v13 = [PKApplyTermsAndConditionsViewController alloc];
  v14 = [(PKApplyExplanationViewController *)self controller];
  id v15 = [(PKApplyExplanationViewController *)self setupDelegate];
  v16 = [(PKApplyTermsAndConditionsViewController *)v13 initWithController:v14 setupDelegate:v15 context:[(PKExplanationViewController *)self context] termsIdentifier:self->_offerTermsIdentifier];

  [(PKFeatureTermsAndConditionsViewController *)v16 setUseModalPresentation:1];
  uint64_t v17 = [(PKApplyOfferViewController *)self navigationController];
  objc_msgSend(v17, "pk_presentPaymentSetupViewController:animated:completion:", v16, 1, 0);
}

- (void)_terminateApplyFlowWithoutDeclining
{
  uint64_t v3 = [(PKApplyExplanationViewController *)self setupDelegate];
  uint64_t v4 = (void *)v3;
  if (self->_installmentConfiguration) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    [(PKApplyExplanationViewController *)self terminateSetupFlow];
  }
  else
  {
    uint64_t v6 = [(PKApplyExplanationViewController *)self controller];
    uint64_t v7 = [v6 featureApplication];

    [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke;
    v8[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v9, &location);
    [v4 viewController:self canProceedWithInstallment:0 featureApplication:v7 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __65__PKApplyOfferViewController__terminateApplyFlowWithoutDeclining__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showNavigationBarSpinner:0];
    [v2 terminateSetupFlow];
    id WeakRetained = v2;
  }
}

- (void)_termsAccepted:(BOOL)a3 actionIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self->_inUseAssertion)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1E5E8];
    objc_super v8 = PKPassKitCoreBundle();
    id v9 = (CLInUseAssertion *)[v7 newAssertionForBundle:v8 withReason:@"Accepting application terms"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v9;
  }
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  BOOL v11 = [(PKApplyExplanationViewController *)self controller];
  offerTermsIdentifier = self->_offerTermsIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke;
  v13[3] = &unk_1E59D8AC0;
  objc_copyWeak(&v14, &location);
  BOOL v15 = v4;
  v13[4] = self;
  [v11 termsAccepted:v4 termsIdentifier:offerTermsIdentifier secondaryIdentifier:0 actionIdentifier:v6 completion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 48) && *(void *)(*(void *)(a1 + 32) + 1224))
    {
      objc_super v8 = [MEMORY[0x1E4F1C9C8] date];
      PKSharedCacheSetObjectForKey();
    }
    uint64_t v9 = [*(id *)(a1 + 32) setupDelegate];
    uint64_t v10 = (void *)v9;
    if (*(void *)(*(void *)(a1 + 32) + 1224)) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      [WeakRetained handleNextViewController:v5 displayableError:v6];
    }
    else
    {
      uint64_t v12 = [WeakRetained controller];
      v13 = [v12 featureApplication];

      if (*(unsigned char *)(a1 + 48)) {
        BOOL v14 = *(unsigned char *)(*(void *)(a1 + 32) + 1232) != 0;
      }
      else {
        BOOL v14 = 0;
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_2;
      v15[3] = &unk_1E59CA8E8;
      id v16 = WeakRetained;
      id v17 = v5;
      id v18 = v6;
      [v10 viewController:v16 canProceedWithInstallment:v14 featureApplication:v13 completion:v15];
    }
  }
}

void __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_2(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_3;
  block[3] = &unk_1E59CA8E8;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__PKApplyOfferViewController__termsAccepted_actionIdentifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNextViewController:*(void *)(a1 + 40) displayableError:*(void *)(a1 + 48)];
}

- (UIImage)heroImage
{
  return self->_heroImage;
}

- (void)setHeroImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_offerTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_offerView, 0);

  objc_storeStrong((id *)&self->_accountController, 0);
}

@end