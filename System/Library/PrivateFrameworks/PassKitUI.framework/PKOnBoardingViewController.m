@interface PKOnBoardingViewController
- (BOOL)preflightCalled;
- (PKDynamicProvisioningPageContent)currentPage;
- (PKOnBoardingViewController)initWithParentFlowController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 provisioningController:(id)a6 paymentSetupProduct:(id)a7 currentPage:(id)a8;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupProduct)paymentSetupProduct;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKSetupFlowControllerProtocol)parentFlowController;
- (UIImage)heroImage;
- (id)nextOnboardingViewControllerWithPage:(id)a3 product:(id)a4;
- (unint64_t)paymentSetupMarker;
- (void)_presentPayLaterSetupFlowForProduct:(id)a3;
- (void)explanationViewDidSelectBodyButton:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)handleNotifyRequested;
- (void)preflightWithCompletion:(id)a3;
- (void)setCurrentPage:(id)a3;
- (void)setHeroImage:(id)a3;
- (void)setParentFlowController:(id)a3;
- (void)setPaymentSetupProduct:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)terminateSetupFlow;
- (void)updateForHeroImage;
- (void)viewDidLoad;
@end

@implementation PKOnBoardingViewController

- (PKOnBoardingViewController)initWithParentFlowController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 provisioningController:(id)a6 paymentSetupProduct:(id)a7 currentPage:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)PKOnBoardingViewController;
  v19 = [(PKExplanationViewController *)&v22 initWithContext:a5];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_parentFlowController, v14);
    objc_storeWeak((id *)&v20->_setupDelegate, v15);
    objc_storeStrong((id *)&v20->_provisioningController, a6);
    objc_storeStrong((id *)&v20->_paymentSetupProduct, a7);
    objc_storeStrong((id *)&v20->_currentPage, a8);
    [(PKExplanationViewController *)v20 setExplanationViewControllerDelegate:v20];
    [(PKOnBoardingViewController *)v20 setModalInPresentation:1];
  }

  return v20;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)PKOnBoardingViewController;
  [(PKExplanationViewController *)&v23 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  v21 = [(PKOnBoardingViewController *)self navigationItem];
  [v21 setHidesBackButton:1];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  objc_super v22 = [v4 footerView];
  [v22 setManualEntryButton:0];
  [v3 setShowPrivacyView:0];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  uint64_t v5 = [(PKDynamicProvisioningPageContent *)self->_currentPage title];
  if (v5) {
    [v3 setTitleText:v5];
  }
  v19 = (void *)v5;
  uint64_t v6 = [(PKDynamicProvisioningPageContent *)self->_currentPage subtitle];
  if (v6) {
    [v3 setBodyText:v6];
  }
  id v18 = (void *)v6;
  v7 = [(PKDynamicProvisioningPageContent *)self->_currentPage body];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
    [v3 setAttributedSecondaryBodyText:v8];
  }
  v9 = [(PKDynamicProvisioningPageContent *)self->_currentPage learnMore];
  v10 = [v9 buttonTitle];
  if (v10) {
    [v3 setBodyButtonText:v10];
  }
  v11 = [(PKDynamicProvisioningPageContent *)self->_currentPage disclosureTitle];
  if (v11) {
    [v4 setButtonExplanationText:v11];
  }
  v12 = [(PKDynamicProvisioningPageContent *)self->_currentPage primaryActionTitle];
  v20 = v4;
  v13 = [v4 primaryButton];
  id v14 = v13;
  if (v12)
  {
    [v13 setTitle:v12 forState:0];
  }
  else
  {
    id v15 = PKLocalizedPaymentString(&cfstr_Continue.isa);
    [v14 setTitle:v15 forState:0];
  }
  id v16 = [(PKDynamicProvisioningPageContent *)self->_currentPage secondaryActionTitle];
  if (v16)
  {
    [v3 setForceShowSetupLaterButton:1];
    id v17 = [v22 setupLaterButton];
    [v17 setTitle:v16 forState:0];
  }
  else
  {
    [v3 setForceShowSetupLaterButton:0];
  }
  if ([(PKDynamicProvisioningPageContent *)self->_currentPage contentAlignment] == 4)
  {
    [v3 setTitleTextAlignment:4];
    [v3 setBodyTextAlignment:4];
  }
  [(PKOnBoardingViewController *)self updateForHeroImage];
}

- (void)setHeroImage:(id)a3
{
  objc_storeStrong((id *)&self->_heroImage, a3);

  [(PKOnBoardingViewController *)self updateForHeroImage];
}

- (void)updateForHeroImage
{
  id v4 = [(PKExplanationViewController *)self explanationView];
  if (self->_heroImage)
  {
    objc_msgSend(v4, "setImage:");
    [v4 setTopBackgroundColor:0];
  }
  else
  {
    objc_msgSend(v4, "setImage:");
    v3 = PKProvisioningSecondaryBackgroundColor();
    [v4 setTopBackgroundColor:v3];
  }
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void))v4;
  self->_preflightCalled = 1;
  if (self->_heroImage)
  {
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    uint64_t v6 = [(PKDynamicProvisioningPageContent *)self->_currentPage heroImageURL];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      v8 = PKLogFacilityTypeGetObject();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKOnboardingViewController preflighting", buf, 2u);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke;
        aBlock[3] = &unk_1E59D2B70;
        aBlock[4] = self;
        id v18 = v6;
        v19 = v5;
        v10 = (void (**)(void *, void *))_Block_copy(aBlock);
        v11 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
        v12 = [v11 cachedDataForURL:v7];

        if (v12)
        {
          v10[2](v10, v12);
        }
        else
        {
          id v14 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_2;
          v15[3] = &unk_1E59CE028;
          id v16 = v10;
          [v14 downloadFromUrl:v7 completionHandler:v15];
        }
      }
      else
      {
        if (v9)
        {
          *(_DWORD *)buf = 138412290;
          v21 = v6;
          _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Could not create valid URL for :%@", buf, 0xCu);
        }

        if (v5) {
          v5[2](v5, 1);
        }
      }
    }
    else
    {
      v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKOnboardingViewController - nothing to preflight", buf, 2u);
      }

      if (v5) {
        v5[2](v5, 1);
      }
    }
  }
}

void __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    PKScreenScale();
    uint64_t v5 = objc_msgSend(v4, "imageWithData:scale:", v3);
    uint64_t v6 = a1[4];
    v7 = *(void **)(v6 + 1088);
    *(void *)(v6 + 1088) = v5;

    uint64_t v8 = *(void *)(a1[4] + 1088);
    BOOL v9 = PKLogFacilityTypeGetObject();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        uint64_t v11 = a1[5];
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v11;
        v12 = "Created image for URL: %{public}@";
LABEL_7:
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (v10)
    {
      uint64_t v13 = a1[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v13;
      v12 = "Failed to create image for URL: %{public}@";
      goto LABEL_7;
    }
  }
  id v14 = (void *)a1[6];
  if (v14)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_59;
    block[3] = &unk_1E59CAA98;
    id v16 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  unint64_t v4 = [(PKDynamicProvisioningPageContent *)self->_currentPage pageNumber] + 1;
  uint64_t v5 = [(PKPaymentSetupProduct *)self->_paymentSetupProduct onboardingItems];
  if (v4 < [v5 count]
    && ([v5 objectAtIndex:v4], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    uint64_t v8 = [(PKOnBoardingViewController *)self nextOnboardingViewControllerWithPage:v6 product:self->_paymentSetupProduct];
    [(PKExplanationViewController *)self showNavigationBarSpinner:1];
    BOOL v9 = [(PKOnBoardingViewController *)self navigationController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__PKOnBoardingViewController_explanationViewDidSelectContinue___block_invoke;
    v15[3] = &unk_1E59CB6D8;
    void v15[4] = self;
    objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, v15);
  }
  else
  {
    BOOL v10 = [(PKPaymentSetupProduct *)self->_paymentSetupProduct configuration];
    unint64_t v11 = [v10 state];

    if (v11 >= 3)
    {
      if (v11 == 3)
      {
        uint64_t v13 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "State is notify making request", v14, 2u);
        }

        [(PKOnBoardingViewController *)self handleNotifyRequested];
      }
      else if (v11 == 4)
      {
        v12 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "State is notify requested or invalid state transition - terminating setup flow", v14, 2u);
        }

        [(PKOnBoardingViewController *)self terminateSetupFlow];
      }
    }
    else
    {
      [(PKOnBoardingViewController *)self handleProductAvailable];
    }
  }
}

uint64_t __63__PKOnBoardingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  id v16 = [(PKDynamicProvisioningPageContent *)self->_currentPage learnMore];
  unint64_t v4 = [v16 buttonURL];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 scheme];
    int v7 = [v6 containsString:@"http"];

    if (v7)
    {
      uint64_t v8 = (PKPaymentMoreInformationViewController *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v5];
      [(PKPaymentMoreInformationViewController *)v8 setModalPresentationStyle:2];
      [(PKOnBoardingViewController *)self presentViewController:v8 animated:1 completion:0];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [(PKPaymentMoreInformationViewController *)v8 openSensitiveURL:v5 withOptions:0];
    }
  }
  else
  {
    uint64_t v8 = [[PKPaymentMoreInformationViewController alloc] initWithContext:[(PKExplanationViewController *)self context]];
    BOOL v9 = [v16 title];
    [(PKPaymentMoreInformationViewController *)v8 setDetailTitle:v9];

    BOOL v10 = [v16 subtitle];
    [(PKPaymentMoreInformationViewController *)v8 setDetailSubtitle:v10];

    unint64_t v11 = [v16 body];
    [(PKPaymentMoreInformationViewController *)v8 setDetailBody:v11];

    v12 = [v16 businessChatIntentName];
    [(PKPaymentMoreInformationViewController *)v8 setBusinessChatIntentName:v12];

    uint64_t v13 = [v16 businessChatButtonTitle];
    [(PKPaymentMoreInformationViewController *)v8 setBusinessChatButtonTitle:v13];

    id v14 = [[PKNavigationController alloc] initWithRootViewController:v8];
    id v15 = [(PKOnBoardingViewController *)self navigationController];
    objc_msgSend(v15, "presentModalViewController:withPaymentSetupContext:", v14, -[PKExplanationViewController context](self, "context"));
  }
}

- (void)terminateSetupFlow
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    uint64_t v6 = [(PKOnBoardingViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)handleNotifyRequested
{
  id v3 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
  unint64_t v4 = [v3 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    [(PKExplanationViewController *)self showNavigationBarSpinner:1];
    uint64_t v5 = [(PKPaymentSetupProduct *)self->_paymentSetupProduct configuration];
    uint64_t v6 = [v5 productIdentifier];

    id v7 = objc_alloc_init(MEMORY[0x1E4F84BB0]);
    [v7 addDiagnosticReason:@"Product Action"];
    [v7 setAction:*MEMORY[0x1E4F87BF8]];
    [v7 setProductIdentifier:v6];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke;
    v9[3] = &unk_1E59DED20;
    id v10 = v6;
    unint64_t v11 = self;
    id v8 = v6;
    [v4 performProductActionRequest:v7 completion:v9];
  }
  else
  {
    [(PKOnBoardingViewController *)self terminateSetupFlow];
  }
}

void __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2;
  v11[3] = &unk_1E59CB8B0;
  id v12 = v5;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F84CB0]);
    id v3 = [*(id *)(a1 + 32) JSONObject];
    [v2 updateWithPaymentSetupProductsResponse:v3 productsFilter:0 sectionsFilter:0];

    unint64_t v4 = [v2 productForProductIdentifier:*(void *)(a1 + 40)];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 configuration];
      unint64_t v7 = [v6 state];

      uint64_t v8 = [v5 configuration];
      uint64_t v9 = [v8 featureIdentifier];

      if (v7 <= 4)
      {
        if (((1 << v7) & 0xD) == 0)
        {
          id v12 = *(void **)(a1 + 48);
          if (v7 == 1 && v9 == 3)
          {
            [*(id *)(a1 + 48) _presentPayLaterSetupFlowForProduct:v5];
          }
          else
          {
            id v13 = [v5 onboardingItems];
            uint64_t v14 = [v13 firstObject];
            id v15 = [v12 nextOnboardingViewControllerWithPage:v14 product:v5];

            id v16 = [*(id *)(a1 + 48) navigationController];
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_79;
            v18[3] = &unk_1E59CB6D8;
            v18[4] = *(void *)(a1 + 48);
            objc_msgSend(v16, "pk_presentPaymentSetupViewController:animated:completion:", v15, 1, v18);
          }
          goto LABEL_11;
        }
        id v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Error: Request notify me but got incorrect state. Showing error", buf, 2u);
        }
      }
    }
  }
  id v2 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 56), 0, 0, 0);
  unint64_t v11 = *(void **)(a1 + 48);
  if (!v2)
  {
    [v11 showNavigationBarSpinner:0];
    [*(id *)(a1 + 48) terminateSetupFlow];
    goto LABEL_13;
  }
  id v5 = [v11 navigationController];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2_80;
  v17[3] = &unk_1E59CA7D0;
  v17[4] = *(void *)(a1 + 48);
  [v5 presentViewController:v2 animated:1 completion:v17];
LABEL_11:

LABEL_13:
}

uint64_t __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_79(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

uint64_t __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2_80(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (id)nextOnboardingViewControllerWithPage:(id)a3 product:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [PKOnBoardingViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlowController);
  id v10 = objc_loadWeakRetained((id *)&self->_setupDelegate);
  unint64_t v11 = [(PKOnBoardingViewController *)v8 initWithParentFlowController:WeakRetained setupDelegate:v10 context:[(PKExplanationViewController *)self context] provisioningController:self->_provisioningController paymentSetupProduct:v6 currentPage:v7];

  return v11;
}

- (void)_presentPayLaterSetupFlowForProduct:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Completed notify me flow for pay later. The product action response says the feature is now available. Going straight to pay later setup flow", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v6 = [v4 configuration];
  [v6 featureIdentifier];

  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  uint64_t v8 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
  uint64_t v9 = (void *)[v7 initWithWebService:v8];

  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v11 = PKFeatureIdentifierToString();
  id v12 = [v10 setWithObject:v11];
  [v9 setAllowedFeatureIdentifiers:v12];

  id v13 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
  [v9 setReferrerIdentifier:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke;
  v16[3] = &unk_1E59CE810;
  objc_copyWeak(&v19, buf);
  v16[4] = self;
  id v14 = v9;
  id v17 = v14;
  id v15 = v4;
  id v18 = v15;
  [v14 preflightWithRequirements:41 completionRequirements:41 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);
}

void __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_2;
      v15[3] = &unk_1E59CA7D0;
      void v15[4] = WeakRetained;
      id v7 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v15, 0);
      if (v7) {
        [v6 presentViewController:v7 animated:1 completion:0];
      }
    }
    else
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84ED0]), "initWithEnvironment:provisioningController:groupsController:", objc_msgSend(*(id *)(a1 + 32), "context"), *(void *)(a1 + 40), 0);
      uint64_t v9 = objc_alloc_init(PKNavigationController);
      uint64_t v10 = *(void *)(a1 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_3;
      v13[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_4;
      v11[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v12, (id *)(a1 + 56));
      +[PKProvisioningFlowBridge startProductManualEntryFlowWithNavController:v9 context:v8 product:v10 presentNavController:v13 completion:v11];
      [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
    }
  }
}

uint64_t __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) showNavigationBarSpinner:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 terminateSetupFlow];
}

void __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showNavigationBarSpinner:0];
}

void __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 terminateSetupFlow];
}

- (unint64_t)paymentSetupMarker
{
  return 3;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlowController);

  return (PKSetupFlowControllerProtocol *)WeakRetained;
}

- (void)setParentFlowController:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (PKPaymentSetupProduct)paymentSetupProduct
{
  return self->_paymentSetupProduct;
}

- (void)setPaymentSetupProduct:(id)a3
{
}

- (PKDynamicProvisioningPageContent)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(id)a3
{
}

- (UIImage)heroImage
{
  return self->_heroImage;
}

- (BOOL)preflightCalled
{
  return self->_preflightCalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_currentPage, 0);
  objc_storeStrong((id *)&self->_paymentSetupProduct, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);

  objc_destroyWeak((id *)&self->_parentFlowController);
}

@end