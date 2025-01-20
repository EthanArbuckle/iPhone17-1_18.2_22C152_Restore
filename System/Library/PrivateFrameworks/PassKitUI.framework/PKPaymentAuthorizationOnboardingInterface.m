@interface PKPaymentAuthorizationOnboardingInterface
- (NSError)setupError;
- (PKNavigationController)primaryViewController;
- (PKPaymentAuthorizationOnboardingInterface)initWithOnboardingContext:(int64_t)a3 authorizationContext:(id)a4 configuration:(id)a5;
- (PKPaymentAuthorizationOnboardingInterfaceDelegate)delegate;
- (PKPaymentProvisioningController)provisioningController;
- (id)_createBindRequestForFeatureApplication:(id)a3;
- (id)_createPrimaryViewController;
- (id)_setupErrorUserInfoWithBindToken:(id)a3;
- (id)applyWelcomeCardExperiment;
- (void)_bindFeatureApplication:(id)a3 completion:(id)a4;
- (void)_getAugmentedProduct:(id)a3;
- (void)_getProduct:(id)a3;
- (void)_loadFeatureOnboardingViewControllerForProduct:(id)a3 completion:(id)a4;
- (void)loadingViewControllerDidCancel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryViewController:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setSetupError:(id)a3;
- (void)viewController:(id)a3 canProceedWithInstallment:(BOOL)a4 featureApplication:(id)a5 completion:(id)a6;
- (void)viewControllerDidCancelSetupFlow:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)willAppear;
@end

@implementation PKPaymentAuthorizationOnboardingInterface

- (id)applyWelcomeCardExperiment
{
  applyWelcomeCardExperiment = self->_applyWelcomeCardExperiment;
  if (!applyWelcomeCardExperiment)
  {
    if (self->_feature == 2)
    {
      v4 = (PKAppleCardWelcomeExperiment *)objc_alloc_init(MEMORY[0x1E4F84408]);
      v5 = self->_applyWelcomeCardExperiment;
      self->_applyWelcomeCardExperiment = v4;

      applyWelcomeCardExperiment = self->_applyWelcomeCardExperiment;
    }
    else
    {
      applyWelcomeCardExperiment = 0;
    }
  }
  v6 = applyWelcomeCardExperiment;

  return v6;
}

- (PKPaymentProvisioningController)provisioningController
{
  provisioningController = self->_provisioningController;
  if (!provisioningController)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F84BB8]);
    v5 = [MEMORY[0x1E4F84D50] sharedService];
    v6 = (PKPaymentProvisioningController *)[v4 initWithWebService:v5];
    v7 = self->_provisioningController;
    self->_provisioningController = v6;

    v8 = self->_provisioningController;
    v9 = [(PKPaymentAuthorizationContext *)self->_authorizationContext request];
    v10 = [v9 installmentConfiguration];
    v11 = [v10 referrerIdentifier];
    [(PKPaymentProvisioningController *)v8 setReferrerIdentifier:v11];

    v12 = self->_provisioningController;
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v14 = PKFeatureIdentifierToString();
    v15 = [v13 setWithObject:v14];
    [(PKPaymentProvisioningController *)v12 setAllowedFeatureIdentifiers:v15];

    provisioningController = self->_provisioningController;
  }

  return provisioningController;
}

- (PKPaymentAuthorizationOnboardingInterface)initWithOnboardingContext:(int64_t)a3 authorizationContext:(id)a4 configuration:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentAuthorizationOnboardingInterface;
  v11 = [(PKPaymentAuthorizationOnboardingInterface *)&v19 init];
  v12 = v11;
  if (v11)
  {
    v11->_onboardingContext = a3;
    objc_storeStrong((id *)&v11->_authorizationContext, a4);
    objc_storeStrong((id *)&v12->_configuration, a5);
    v13 = [v9 request];
    v14 = [v13 installmentConfiguration];
    [v14 feature];
    v12->_feature = PKFeatureIdentifierFromPaymentSetupFeatureType();

    if (!v12->_feature)
    {
      v17 = 0;
      goto LABEL_6;
    }
    uint64_t v15 = [(PKPaymentAuthorizationOnboardingInterface *)v12 _createPrimaryViewController];
    primaryViewController = v12->_primaryViewController;
    v12->_primaryViewController = (PKNavigationController *)v15;
  }
  v17 = v12;
LABEL_6:

  return v17;
}

- (id)_createPrimaryViewController
{
  v3 = [[PKLoadingViewController alloc] initWithDelegate:self];
  id v4 = [[PKNavigationController alloc] initWithRootViewController:v3];
  [(PKNavigationController *)v4 setSupportedInterfaceOrientations:[(PKPaymentAuthorizationInterfaceConfiguration *)self->_configuration supportedOrientations]];
  if ([(UIViewController *)v3 pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v4 setModalPresentationStyle:16];
    v5 = [(PKNavigationController *)v4 view];
    v6 = [v5 layer];

    [v6 setMasksToBounds:1];
    [v6 setCornerRadius:6.0];
  }
  else
  {
    [(PKNavigationController *)v4 setModalPresentationStyle:3];
  }

  return v4;
}

- (void)willAppear
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke;
  v2[3] = &unk_1E59CF2F0;
  v2[4] = self;
  [(PKPaymentAuthorizationOnboardingInterface *)self _getProduct:v2];
}

void __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_15;
    v10[3] = &unk_1E59CF2C8;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 32);
    id v11 = v6;
    uint64_t v12 = v7;
    [v5 _getAugmentedProduct:v10];
    v8 = v11;
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't get payment setup product. Dismissing payment authorization.", buf, 2u);
    }

    v8 = [*(id *)(*(void *)(a1 + 32) + 24) presenter];
    [v8 dismissWithReason:1 error:0 completion:0];
  }
}

void __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) augmentWithProduct:v3];
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Couldn't get augmented product. Continuining without augmenting.", buf, 2u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_16;
  v7[3] = &unk_1E59CF2A0;
  v7[4] = v5;
  [v5 _loadFeatureOnboardingViewControllerForProduct:v6 completion:v7];
}

void __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  v8 = a2;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  uint64_t v6 = [v4 arrayWithObjects:&v8 count:1];
  objc_msgSend(v3, "setViewControllers:animated:", v6, 0, v8, v9);

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) presentationController];
  [v7 setDelegate:v5];
}

- (void)_getProduct:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationOnboardingInterface *)self provisioningController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke;
  v7[3] = &unk_1E59CF340;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 preflightWithCompletion:v7];
}

void __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke_2;
  block[3] = &unk_1E59CF318;
  char v6 = a2;
  id v3 = *(id *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) provisioningController];
    id v6 = [v2 paymentSetupProductModel];

    id v3 = [v6 productsForFeatureIdentifier:*(void *)(*(void *)(a1 + 32) + 32)];
    id v4 = [v3 firstObject];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

- (void)_getAugmentedProduct:(id)a3
{
  id v4 = a3;
  PKLogFacilityTypeGetObject();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "request:augmentedProduct", "", buf, 2u);
    }
  }

  id v8 = [(PKPaymentAuthorizationContext *)self->_authorizationContext request];
  uint64_t v9 = [(PKPaymentAuthorizationOnboardingInterface *)self applyWelcomeCardExperiment];
  id v10 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  id v11 = [v8 installmentConfiguration];
  uint64_t v12 = [v9 experimentDetails];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke;
  v14[3] = &unk_1E59CF368;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v10 augmentedProductForInstallmentConfiguration:v11 experimentDetails:v12 withCompletion:v14];
}

void __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) product];
  PKLogFacilityTypeGetObject();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, *(const void **)(a1 + 40));
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)id v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v3, OS_SIGNPOST_INTERVAL_END, v5, "request:augmentedProduct", "", v6, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_loadFeatureOnboardingViewControllerForProduct:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [PKFeatureOnBoardingViewController alloc];
  int64_t onboardingContext = self->_onboardingContext;
  unint64_t feature = self->_feature;
  id v11 = [(PKPaymentAuthorizationOnboardingInterface *)self provisioningController];
  uint64_t v12 = [v7 onboardingItems];
  id v13 = [v12 firstObject];
  v14 = [(PKFeatureOnBoardingViewController *)v8 initWithParentFlowController:0 setupDelegate:self setupContext:8 onboardingContext:onboardingContext featureIdentifier:feature provisioningController:v11 paymentSetupProduct:v7 currentPage:v13];

  id v15 = [(PKPaymentAuthorizationContext *)self->_authorizationContext request];
  v16 = [v15 installmentConfiguration];
  [(PKFeatureOnBoardingViewController *)v14 setInstallmentConfiguration:v16];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke;
  v19[3] = &unk_1E59CA820;
  v20 = v14;
  id v21 = v6;
  v17 = v14;
  id v18 = v6;
  [(PKFeatureOnBoardingViewController *)v17 preflightWithCompletion:v19];
}

void __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke_2;
  v2[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loadingViewControllerDidCancel:(id)a3
{
  id v3 = [(PKPaymentAuthorizationInterfaceConfiguration *)self->_configuration presenter];
  [v3 dismissWithReason:3 error:0 completion:0];
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained paymentAuthorizationOnboardingDidFinishWithError:self->_setupError];
}

- (void)viewController:(id)a3 canProceedWithInstallment:(BOOL)a4 featureApplication:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v8)
  {
    if (v12) {
      (*((void (**)(id))v12 + 2))(v12);
    }
  }
  else
  {
    v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Cannot proceed with installment authorization", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __116__PKPaymentAuthorizationOnboardingInterface_viewController_canProceedWithInstallment_featureApplication_completion___block_invoke;
    v15[3] = &unk_1E59CF390;
    objc_copyWeak(&v17, buf);
    id v16 = v13;
    [(PKPaymentAuthorizationOnboardingInterface *)self _bindFeatureApplication:v11 completion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }
}

void __116__PKPaymentAuthorizationOnboardingInterface_viewController_canProceedWithInstallment_featureApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    os_signpost_id_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F87538];
    id v7 = [WeakRetained _setupErrorUserInfoWithBindToken:v10];
    BOOL v8 = [v5 errorWithDomain:v6 code:-2016 userInfo:v7];
    [v4 setSetupError:v8];

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
}

- (id)_setupErrorUserInfoWithBindToken:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x1E4F879C8];
    v8[0] = a3;
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    os_signpost_id_t v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    os_signpost_id_t v5 = 0;
  }

  return v5;
}

- (void)_bindFeatureApplication:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PKPaymentAuthorizationOnboardingInterface *)self _createBindRequestForFeatureApplication:a3];
  BOOL v8 = [MEMORY[0x1E4F84D50] sharedService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentAuthorizationOnboardingInterface__bindFeatureApplication_completion___block_invoke;
  v10[3] = &unk_1E59CF3B8;
  id v11 = v6;
  id v9 = v6;
  [v8 performInstallmentBindWithRequest:v7 completion:v10];
}

void __80__PKPaymentAuthorizationOnboardingInterface__bindFeatureApplication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Installment bind error: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [v5 bindToken];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createBindRequestForFeatureApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationContext *)self->_authorizationContext request];
  id v6 = objc_alloc_init(MEMORY[0x1E4F84338]);
  uint64_t v7 = [v4 applicationIdentifier];
  [v6 setApplicationIdentifier:v7];

  BOOL v8 = [v5 installmentConfiguration];
  id v9 = [v8 bindingTotalAmount];
  [v6 setBindingAmount:v9];

  int v10 = [v5 merchantIdentifier];
  if (v10)
  {
    [v6 setMerchantIdentifier:v10];
  }
  else
  {
    id v11 = [v5 installmentConfiguration];
    uint64_t v12 = [v11 installmentMerchantIdentifier];
    [v6 setMerchantIdentifier:v12];
  }
  id v13 = [v4 applicationBaseURL];
  [v6 setBaseURL:v13];

  return v6;
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134349056;
    uint64_t v7 = self;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationOnboardingInterface (%{public}p): Dismissing because setup was cancelled", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(PKPaymentAuthorizationInterfaceConfiguration *)self->_configuration presenter];
  [v5 dismissWithReason:3 error:0 completion:0];
}

- (PKNavigationController)primaryViewController
{
  return self->_primaryViewController;
}

- (void)setPrimaryViewController:(id)a3
{
}

- (PKPaymentAuthorizationOnboardingInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationOnboardingInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setProvisioningController:(id)a3
{
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_applyWelcomeCardExperiment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_authorizationContext, 0);
}

@end