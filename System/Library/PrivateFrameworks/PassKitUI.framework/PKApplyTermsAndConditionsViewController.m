@interface PKApplyTermsAndConditionsViewController
- (BOOL)preflightPDFTerms;
- (PKApplyTermsAndConditionsViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 termsIdentifier:(id)a6;
- (id)displayTitle;
- (void)_terminateSetupFlow;
- (void)dealloc;
- (void)htmlTermsDataWithCompletion:(id)a3;
- (void)initalTermsDataWithCompletion:(id)a3;
- (void)pdfTermsDataWithIdentifier:(id)a3 completion:(id)a4;
- (void)presentErrorAlert;
- (void)reportAnalyticsForTermsLink:(id)a3;
- (void)setPreflightPDFTerms:(BOOL)a3;
- (void)termsAccepted:(BOOL)a3 completion:(id)a4;
- (void)termsShown;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKApplyTermsAndConditionsViewController

- (PKApplyTermsAndConditionsViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 termsIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyTermsAndConditionsViewController;
  v12 = [(PKFeatureTermsAndConditionsViewController *)&v17 initWithSetupDelegate:a4 context:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_applyController, v10);
    uint64_t v14 = [v11 copy];
    termsIdentifier = v13->_termsIdentifier;
    v13->_termsIdentifier = (NSString *)v14;

    v13->_preflightPDFTerms = 0;
  }

  return v13;
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
  v5.super_class = (Class)PKApplyTermsAndConditionsViewController;
  [(PKApplyTermsAndConditionsViewController *)&v5 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PKApplyTermsAndConditionsViewController;
  [(PKApplyTermsAndConditionsViewController *)&v13 viewDidAppear:a3];
  p_applyController = &self->_applyController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  [WeakRetained applyFlowDidAppear];

  id v6 = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v7 = [v6 featureIdentifier];

  if (v7 == 2)
  {
    if (self->_termsIdentifier) {
      v8 = (id *)MEMORY[0x1E4F86FF0];
    }
    else {
      v8 = (id *)MEMORY[0x1E4F86FF8];
    }
    id v9 = *v8;
    id v10 = objc_loadWeakRetained((id *)p_applyController);
    uint64_t v11 = *MEMORY[0x1E4F85FA8];
    uint64_t v14 = *MEMORY[0x1E4F86308];
    v15[0] = *MEMORY[0x1E4F864A0];
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v10 reportAnalyticsDictionaryForPage:0 subject:v9 pageTag:v11 additionalValues:v12];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKApplyTermsAndConditionsViewController;
  [(PKApplyTermsAndConditionsViewController *)&v12 viewDidDisappear:a3];
  p_applyController = &self->_applyController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v6 = [WeakRetained featureIdentifier];

  if (v6 == 2)
  {
    if (self->_termsIdentifier) {
      uint64_t v7 = (id *)MEMORY[0x1E4F86FF0];
    }
    else {
      uint64_t v7 = (id *)MEMORY[0x1E4F86FF8];
    }
    id v8 = *v7;
    id v9 = objc_loadWeakRetained((id *)p_applyController);
    uint64_t v10 = *MEMORY[0x1E4F85FA8];
    uint64_t v13 = *MEMORY[0x1E4F86308];
    v14[0] = *MEMORY[0x1E4F864A8];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v9 reportAnalyticsDictionaryForPage:0 subject:v8 pageTag:v10 additionalValues:v11];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyTermsAndConditionsViewController;
  [(PKApplyTermsAndConditionsViewController *)&v6 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    objc_super v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
}

- (id)displayTitle
{
  p_applyController = &self->_applyController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v4 = [WeakRetained featureIdentifier];

  if (v4 == 5)
  {
    objc_super v5 = 0;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_applyController);
    uint64_t v7 = [v6 preferredLanguage];

    objc_super v5 = PKLocalizedApplyFeatureString();
  }

  return v5;
}

- (void)initalTermsDataWithCompletion:(id)a3
{
  if (self->_preflightPDFTerms) {
    [(PKApplyTermsAndConditionsViewController *)self pdfTermsDataWithIdentifier:self->_termsIdentifier completion:a3];
  }
  else {
    [(PKApplyTermsAndConditionsViewController *)self htmlTermsDataWithCompletion:a3];
  }
}

- (void)htmlTermsDataWithCompletion:(id)a3
{
  termsIdentifier = self->_termsIdentifier;
  p_applyController = &self->_applyController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_applyController);
  id v8 = WeakRetained;
  if (termsIdentifier) {
    [WeakRetained termsDataForIdentifier:self->_termsIdentifier format:*MEMORY[0x1E4F87EE8] completion:v6];
  }
  else {
    [WeakRetained termsDataForFeatureWithIdentifier:0 format:*MEMORY[0x1E4F87EE8] completion:v6];
  }
}

- (void)pdfTermsDataWithIdentifier:(id)a3 completion:(id)a4
{
  termsIdentifier = self->_termsIdentifier;
  p_applyController = &self->_applyController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_applyController);
  uint64_t v10 = *MEMORY[0x1E4F87EF0];
  id v11 = WeakRetained;
  if (termsIdentifier) {
    [WeakRetained termsDataForIdentifier:v8 format:v10 completion:v7];
  }
  else {
    [WeakRetained termsDataForFeatureWithIdentifier:v8 format:v10 completion:v7];
  }
}

- (void)reportAnalyticsForTermsLink:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 PKStringForKey:@"termsFileName"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v6 = *MEMORY[0x1E4F86468];
  uint64_t v7 = *MEMORY[0x1E4F86BB0];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86E68];
  v13[0] = v6;
  v13[1] = v8;
  v12[2] = *MEMORY[0x1E4F85F90];
  uint64_t v9 = *MEMORY[0x1E4F85FA8];
  if (v4) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = &stru_1EF1B5B50;
  }
  v13[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [WeakRetained reportAnalyticsDictionaryForPage:0 pageTag:v9 additionalValues:v11];
}

- (void)termsShown
{
  if (self->_termsIdentifier)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
    [WeakRetained termsShownWithIdentifier:self->_termsIdentifier];
  }
}

- (void)termsAccepted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v38[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a4;
  uint64_t v7 = (id *)MEMORY[0x1E4F86068];
  if (!v4) {
    uint64_t v7 = (id *)MEMORY[0x1E4F862A8];
  }
  id v8 = *v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v10 = *MEMORY[0x1E4F86380];
  uint64_t v11 = *MEMORY[0x1E4F86120];
  v37[0] = *MEMORY[0x1E4F86308];
  v37[1] = v11;
  v38[0] = v10;
  v38[1] = v8;
  objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [WeakRetained reportAnalyticsDictionaryForPage:0 pageTag:*MEMORY[0x1E4F85FA8] additionalValues:v12];

  id v13 = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v14 = [v13 featureIdentifier];

  if (v14 == 5 || !v4)
  {
    if (!self->_inUseAssertion)
    {
      v24 = (void *)MEMORY[0x1E4F1E5E8];
      v25 = PKPassKitCoreBundle();
      if (v4) {
        v26 = @"Accepting application terms";
      }
      else {
        v26 = @"Declining application terms";
      }
      v27 = (CLInUseAssertion *)[v24 newAssertionForBundle:v25 withReason:v26];
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v27;
    }
    objc_initWeak(&location, self);
    id v29 = objc_loadWeakRetained((id *)&self->_applyController);
    termsIdentifier = self->_termsIdentifier;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_2;
    v31[3] = &unk_1E59D8268;
    objc_copyWeak(&v33, &location);
    v31[4] = self;
    v32 = v6;
    [v29 termsAccepted:v4 termsIdentifier:termsIdentifier secondaryIdentifier:0 actionIdentifier:0 completion:v31];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = [PKApplyTermsVerifyingViewController alloc];
    id v16 = objc_loadWeakRetained((id *)&self->_applyController);
    objc_super v17 = [(PKFeatureTermsAndConditionsViewController *)self setupDelegate];
    int64_t v18 = [(PKFeatureTermsAndConditionsViewController *)self context];
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", self->_termsIdentifier, 0);
    v20 = [(PKApplyTermsVerifyingViewController *)v15 initWithController:v16 setupDelegate:v17 context:v18 termsIdentifiers:v19 applyPage:0];

    v21 = [(PKFeatureTermsAndConditionsViewController *)self containerNavigationController];
    v22 = [(PKApplyTermsAndConditionsViewController *)self presentingViewController];
    objc_opt_class();
    LOBYTE(v18) = objc_opt_isKindOfClass();

    if (v18)
    {
      uint64_t v23 = [(PKApplyTermsAndConditionsViewController *)self presentingViewController];

      v21 = (void *)v23;
    }
    if (v21)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke;
      v35[3] = &unk_1E59CA820;
      v35[4] = self;
      v36 = v6;
      objc_msgSend(v21, "pk_presentPaymentSetupViewController:animated:completion:", v20, 0, v35);
    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
}

uint64_t __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 dismissViewControllerWithCompletion:0];
}

void __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = [a1[4] containerNavigationController];
      uint64_t v9 = [a1[4] presentingViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v11 = [a1[4] presentingViewController];

        id v8 = (void *)v11;
      }
      if (v8)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_3;
        v29[3] = &unk_1E59CA820;
        id v31 = a1[5];
        id v30 = WeakRetained;
        objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 0, v29);
      }
      else
      {
        v25 = (void (**)(void))a1[5];
        if (v25) {
          v25[2]();
        }
      }
    }
    else
    {
      objc_super v12 = (void (**)(void))a1[5];
      if (v6)
      {
        if (v12) {
          v12[2]();
        }
        v26 = PKTitleForDisplayableError();
        id v13 = MEMORY[0x1A6221F20](v6);
        uint64_t v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v26 message:v13 preferredStyle:1];
        id v15 = objc_loadWeakRetained((id *)a1[4] + 187);
        [v15 featureIdentifier];

        id v16 = objc_loadWeakRetained((id *)a1[4] + 187);
        objc_super v17 = [v16 preferredLanguage];

        int64_t v18 = (void *)MEMORY[0x1E4FB1410];
        v19 = PKLocalizedApplyFeatureString();
        v20 = [v18 actionWithTitle:v19 style:0 handler:0];
        [v14 addAction:v20];

        v21 = (void *)MEMORY[0x1E4FB1410];
        v22 = PKLocalizedApplyFeatureString();
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_4;
        v27[3] = &unk_1E59CB1F0;
        id v23 = WeakRetained;
        id v28 = v23;
        v24 = [v21 actionWithTitle:v22 style:1 handler:v27];
        [v14 addAction:v24];

        [v23 presentViewController:v14 animated:1 completion:0];
      }
      else
      {
        if (v12) {
          v12[2]();
        }
        [WeakRetained _terminateSetupFlow];
      }
    }
  }
}

uint64_t __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  uint64_t result = [*(id *)(a1 + 32) dismissViewControllerWithCompletion:0];
  if ((a2 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 _terminateSetupFlow];
  }
  return result;
}

uint64_t __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

- (void)presentErrorAlert
{
  p_applyController = &self->_applyController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  [WeakRetained featureIdentifier];

  id v5 = objc_loadWeakRetained((id *)p_applyController);
  id v12 = [v5 preferredLanguage];

  id v6 = PKLocalizedApplyFeatureString();
  uint64_t v7 = PKLocalizedApplyFeatureString();
  id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = PKLocalizedApplyFeatureString();
  uint64_t v11 = [v9 actionWithTitle:v10 style:1 handler:0];
  [v8 addAction:v11];

  [(PKApplyTermsAndConditionsViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_terminateSetupFlow
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v7, 2u);
  }

  uint64_t v4 = [(PKFeatureTermsAndConditionsViewController *)self setupDelegate];
  id v5 = v4;
  if (v4)
  {
    [v4 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v6 = [(PKApplyTermsAndConditionsViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)preflightPDFTerms
{
  return self->_preflightPDFTerms;
}

- (void)setPreflightPDFTerms:(BOOL)a3
{
  self->_preflightPDFTerms = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);

  objc_destroyWeak((id *)&self->_applyController);
}

@end