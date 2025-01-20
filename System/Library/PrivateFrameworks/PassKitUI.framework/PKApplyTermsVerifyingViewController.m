@interface PKApplyTermsVerifyingViewController
- (PKApplyTermsVerifyingViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 termsIdentifiers:(id)a6 applyPage:(id)a7;
- (id)analyticsPageTag;
- (void)_processTerms;
- (void)_showActivationSpinner:(BOOL)a3;
- (void)_terminateSetupFlow;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKApplyTermsVerifyingViewController

- (PKApplyTermsVerifyingViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 termsIdentifiers:(id)a6 applyPage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PKApplyTermsVerifyingViewController;
  v16 = [(PKExplanationViewController *)&v22 initWithContext:a5];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_applyController, v12);
    uint64_t v18 = [v14 copy];
    termsIdentifiers = v17->_termsIdentifiers;
    v17->_termsIdentifiers = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_setupDelegate, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&v17->_applyController);
    v17->_featureIdentifier = [WeakRetained featureIdentifier];

    objc_storeStrong((id *)&v17->_applyPage, a7);
  }

  return v17;
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
  v5.super_class = (Class)PKApplyTermsVerifyingViewController;
  [(PKApplyTermsVerifyingViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKApplyTermsVerifyingViewController;
  [(PKExplanationViewController *)&v11 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  v3 = [(PKApplyTermsVerifyingViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowPrivacyView:0];
  objc_super v5 = [v4 dockView];
  [v5 setPrimaryButton:0];
  v6 = [v5 footerView];
  [v6 setManualEntryButton:0];
  [v6 setSetupLaterButton:0];
  [(PKApplyTermsVerifyingViewController *)self _showActivationSpinner:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  v8 = [WeakRetained preferredLanguage];

  v9 = PKLocalizedApplyFeatureString();
  [v4 setTitleText:v9];

  v10 = PKLocalizedApplyFeatureString();
  [v4 setBodyText:v10];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKApplyTermsVerifyingViewController;
  [(PKApplyTermsVerifyingViewController *)&v8 viewDidAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  [WeakRetained applyFlowDidAppear];

  [(PKApplyTermsVerifyingViewController *)self _processTerms];
  id v5 = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v6 = *MEMORY[0x1E4F85FA0];
  uint64_t v9 = *MEMORY[0x1E4F86308];
  v10[0] = *MEMORY[0x1E4F864A0];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 reportAnalyticsDictionaryForPage:0 pageTag:v6 additionalValues:v7];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKApplyTermsVerifyingViewController;
  [(PKApplyTermsVerifyingViewController *)&v9 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    id v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  uint64_t v7 = *MEMORY[0x1E4F85FA0];
  uint64_t v10 = *MEMORY[0x1E4F86308];
  v11[0] = *MEMORY[0x1E4F864A8];
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [WeakRetained reportAnalyticsDictionaryForPage:0 pageTag:v7 additionalValues:v8];
}

- (void)_processTerms
{
  if (!self->_isProcessingTerms)
  {
    if (!self->_inUseAssertion)
    {
      v3 = (void *)MEMORY[0x1E4F1E5E8];
      v4 = PKPassKitCoreBundle();
      id v5 = (CLInUseAssertion *)[v3 newAssertionForBundle:v4 withReason:@"Acceping application terms"];
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
    objc_super v8 = [WeakRetained preferredLanguage];

    self->_isProcessingTerms = 1;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke;
    aBlock[3] = &unk_1E59DE2A0;
    objc_copyWeak(&v25, &location);
    id v9 = v8;
    id v23 = v9;
    v24 = self;
    uint64_t v10 = _Block_copy(aBlock);
    if ([(NSSet *)self->_termsIdentifiers count] < 2)
    {
      applyPage = self->_applyPage;
      id v11 = objc_loadWeakRetained((id *)&self->_applyController);
      if (applyPage)
      {
        id v14 = self->_applyPage;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_13;
        v18[3] = &unk_1E59CD320;
        id v19 = v10;
        [v11 submitFieldsPage:v14 completion:v18];
        id v12 = &v19;
      }
      else
      {
        id v15 = [(NSSet *)self->_termsIdentifiers anyObject];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_15;
        v16[3] = &unk_1E59CD320;
        id v17 = v10;
        [v11 termsAccepted:1 termsIdentifier:v15 secondaryIdentifier:0 actionIdentifier:0 completion:v16];
        id v12 = &v17;
      }
    }
    else
    {
      id v11 = objc_loadWeakRetained((id *)&self->_applyController);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_11;
      v20[3] = &unk_1E59CD320;
      id v21 = v10;
      [v11 nextViewControllerWithCompletion:v20];
      id v12 = &v21;
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      objc_super v8 = [MEMORY[0x1E4F84688] sharedInstance];
      [v8 completedDiscoveryItemCTAWithCompletion:0];

      id v9 = objc_loadWeakRetained(WeakRetained + 130);
      uint64_t v10 = [v9 featureApplication];
      uint64_t v11 = [v10 applicationState];

      if (v11 != 6)
      {
        v27 = [WeakRetained navigationController];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3;
        v47[3] = &unk_1E59CB6D8;
        v48 = WeakRetained;
        objc_msgSend(v27, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v47);

        id v12 = v48;
        goto LABEL_9;
      }
      id v12 = [WeakRetained explanationView];
      id v13 = PKLocalizedApplyFeatureString();
      [v12 setTitleText:v13];

      id v14 = PKLocalizedApplyFeatureString();
      [v12 setBodyText:v14];

      [WeakRetained _showActivationSpinner:0];
      id v15 = [WeakRetained explanationView];
      [v15 setShowCheckmark:1];

      v16 = [WeakRetained navigationController];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2;
      v49[3] = &unk_1E59CB6D8;
      v50 = WeakRetained;
      objc_msgSend(v16, "pk_presentPaymentSetupViewController:animated:delay:completion:", v5, 1, 2000000000, v49);

      id v17 = v50;
    }
    else if (v6)
    {
      id v12 = PKTitleForDisplayableError();
      uint64_t v35 = MEMORY[0x1A6221F20](v6);
      uint64_t v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v35 preferredStyle:1];
      id v19 = (void *)MEMORY[0x1E4FB1410];
      v20 = PKLocalizedApplyFeatureString();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4;
      v45[3] = &unk_1E59CB1F0;
      id v21 = WeakRetained;
      v46 = v21;
      objc_super v22 = [v19 actionWithTitle:v20 style:0 handler:v45];
      [v18 addAction:v22];

      id v23 = (void *)MEMORY[0x1E4FB1410];
      v24 = PKLocalizedApplyFeatureString();
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5;
      v43[3] = &unk_1E59CB1F0;
      id v25 = v21;
      v44 = v25;
      v26 = [v23 actionWithTitle:v24 style:1 handler:v43];
      [v18 addAction:v26];

      [v25 presentViewController:v18 animated:1 completion:0];
      id v17 = (void *)v35;
    }
    else
    {
      id v28 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1040));
      id v12 = [v28 account];

      if (!v12)
      {
        *((unsigned char *)WeakRetained + 1064) = 0;
        [WeakRetained _showActivationSpinner:0];
        [WeakRetained _terminateSetupFlow];
        goto LABEL_9;
      }
      if (*(void *)(*(void *)(a1 + 40) + 1072) != 5)
      {
        v30 = [WeakRetained explanationView];
        v31 = PKLocalizedApplyFeatureString();
        [v30 setTitleText:v31];

        v32 = PKLocalizedApplyFeatureString();
        [v30 setBodyText:v32];

        [WeakRetained _showActivationSpinner:0];
        v33 = [WeakRetained explanationView];
        [v33 setShowCheckmark:1];

        dispatch_time_t v34 = dispatch_time(0, 2000000000);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6;
        v41[3] = &unk_1E59CA7D0;
        v42 = WeakRetained;
        dispatch_after(v34, MEMORY[0x1E4F14428], v41);

        goto LABEL_9;
      }
      dispatch_time_t v29 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7;
      block[3] = &unk_1E59D0E90;
      id v37 = v12;
      objc_copyWeak(&v40, (id *)(a1 + 48));
      v38 = WeakRetained;
      id v39 = *(id *)(a1 + 32);
      dispatch_after(v29, MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v40);
      id v17 = v37;
    }

LABEL_9:
  }
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 1064) = 0;
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _terminateSetupFlow];
  }
  return result;
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 1064) = 0;
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _terminateSetupFlow];
  }
  return result;
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1064) = 0;
  return [*(id *)(a1 + 32) _processTerms];
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1064) = 0;
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1064) = 0;
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7(id *a1)
{
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__57;
  v33[4] = __Block_byref_object_dispose__57;
  id v34 = 0;
  v2 = [MEMORY[0x1E4F84270] sharedInstance];
  v3 = [a1[4] accountIdentifier];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  PKSetLastFraudEventDateForAccountIdentifier();

  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_49;
  v29[3] = &unk_1E59CC7D8;
  id v6 = v2;
  id v30 = v6;
  id v7 = v3;
  id v31 = v7;
  v32 = v33;
  [v5 addOperation:v29];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_53;
  v25[3] = &unk_1E59CE5C8;
  id v28 = v33;
  id v8 = v6;
  id v26 = v8;
  id v9 = v7;
  id v27 = v9;
  [v5 addOperation:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_56;
  v22[3] = &unk_1E59CE708;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v24 = v11;
  [v5 addOperation:v22];
  id v12 = [MEMORY[0x1E4F1CA98] null];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_61;
  v15[3] = &unk_1E59DE278;
  objc_copyWeak(&v21, a1 + 7);
  id v13 = v11;
  id v16 = v13;
  v20 = v33;
  id v17 = a1[5];
  id v18 = a1[6];
  id v19 = a1[4];
  id v14 = (id)[v5 evaluateWithInput:v12 completion:v15];

  objc_destroyWeak(&v21);
  _Block_object_dispose(v33, 8);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_49(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v9 = (void *)a1[4];
  id v8 = (void *)a1[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_50;
  v14[3] = &unk_1E59DE190;
  id v10 = v8;
  uint64_t v11 = a1[6];
  id v17 = v7;
  uint64_t v18 = v11;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  [v9 accountWithIdentifier:v10 completion:v14];
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_50(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Created account with identifier %@ is missing on device with error %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  (*(void (**)(void))(a1[6] + 16))();
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_53(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Updating accounts because the new account is missing on device", buf, 2u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_54;
    v15[3] = &unk_1E59DE1B8;
    int v12 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    id v16 = v13;
    uint64_t v19 = v14;
    id v18 = v10;
    id v17 = v8;
    [v12 updateAccountsWithCompletion:v15];
  }
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_54(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Could not update accounts with error %@", buf, 0xCu);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "accountIdentifier", (void)v23);
        id v15 = (void *)a1[4];
        id v16 = v14;
        id v17 = v15;
        if (v16 == v17)
        {

LABEL_19:
          uint64_t v21 = *(void *)(a1[7] + 8);
          id v22 = v13;
          id v16 = *(id *)(v21 + 40);
          *(void *)(v21 + 40) = v22;
LABEL_20:

          continue;
        }
        id v18 = v17;
        if (v16) {
          BOOL v19 = v17 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {

          goto LABEL_20;
        }
        int v20 = [v16 isEqualToString:v17];

        if (v20) {
          goto LABEL_19;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_56(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_57;
  v12[3] = &unk_1E59CE578;
  id v14 = v6;
  id v15 = v7;
  id v13 = v8;
  id v10 = v6;
  id v11 = v7;
  [v9 updatePaymentFundingSourcesForAccountIdentifier:v13 force:1 completion:v12];
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_57(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Could not update bank accounts with error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if ([v5 count])
  {
    id v8 = objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_210);
    PKSetFundingSourceIdsMigratedToSavings();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_58(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_2_61(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3_62;
  v4[3] = &unk_1E59DE250;
  objc_copyWeak(&v10, (id *)(a1 + 72));
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  id v5 = v2;
  uint64_t v9 = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v10);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_3_62(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    PKSetAccountServiceIsNewAccountWithAccountIdentifier();
    uint64_t v3 = *(void *)(a1 + 64);
    if (*(void *)(*(void *)(v3 + 8) + 40))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4_63;
      aBlock[3] = &unk_1E59DE200;
      void aBlock[4] = v3;
      v4 = _Block_copy(aBlock);
      id v5 = [MEMORY[0x1E4F84E00] sharedInstance];
      id v6 = [v5 account];

      id v7 = [v6 currentBalance];
      id v8 = objc_alloc_init(PKPassPresentationContext);
      [(PKPassPresentationContext *)v8 setPresentationSource:1];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6_72;
      v26[3] = &unk_1E59CEF00;
      id v27 = *(id *)(a1 + 40);
      id v28 = *(id *)(a1 + 48);
      id v9 = v4;
      id v31 = v9;
      id v10 = v8;
      id v29 = v10;
      id v30 = WeakRetained;
      uint64_t v11 = (void (**)(void))_Block_copy(v26);
      int v12 = [v7 amount];
      id v13 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v14 = [v12 compare:v13];

      if (v14 == 1)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F84378]);
        id v16 = [*(id *)(a1 + 56) accountBaseURL];
        [v15 setBaseURL:v16];

        id v17 = [*(id *)(a1 + 56) accountIdentifier];
        [v15 setAccountIdentifier:v17];

        [v15 setType:2];
        [v15 setCurrencyAmount:v7];
        id v18 = [MEMORY[0x1E4F84D50] sharedService];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_8;
        v23[3] = &unk_1E59DE228;
        long long v24 = v10;
        long long v25 = v11;
        [v18 transferEligibilityWithRequest:v15 completion:v23];
      }
      else
      {
        v11[2](v11);
      }
    }
    else
    {
      id v9 = [*(id *)(a1 + 40) explanationView];
      BOOL v19 = PKLocalizedApplyFeatureString();
      [v9 setTitleText:v19];

      int v20 = PKLocalizedApplyFeatureString();
      [v9 setBodyText:v20];

      [*(id *)(a1 + 40) _showActivationSpinner:0];
      dispatch_time_t v21 = dispatch_time(0, 2000000000);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_10;
      v22[3] = &unk_1E59CA7D0;
      void v22[4] = WeakRetained;
      dispatch_after(v21, MEMORY[0x1E4F14428], v22);
    }
  }
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_4_63(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 presentingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    [(PKAccountViewInterfaceConfiguration *)v8 setAccount:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    [(PKAccountViewInterfaceConfiguration *)v8 setDestination:0];
    [(PKAccountViewInterfaceConfiguration *)v8 setViewStyle:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5_66;
    v14[3] = &unk_1E59CB6D8;
    id v15 = v6;
    [v7 presentAccountWithConfiguration:v8 presentationContext:v5 animated:0 completion:v14];
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v10 = [v9 delegate];
    uint64_t v11 = [v10 window];
    id v8 = [v11 rootViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v12 = v8;
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;
    if (v13) {
      -[PKAccountViewInterfaceConfiguration presentFeatureSetupOrFeaturePass:referrerIdentifier:presentationContext:completion:](v13, "presentFeatureSetupOrFeaturePass:referrerIdentifier:presentationContext:completion:", [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) feature], 0, v5, 0);
    }
    else {
      [v6 _terminateSetupFlow];
    }
  }
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_5_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_6_72(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) explanationView];
  uint64_t v3 = PKLocalizedApplyFeatureString();
  [v2 setTitleText:v3];

  v4 = PKLocalizedApplyFeatureString();
  [v2 setBodyText:v4];

  [*(id *)(a1 + 32) _showActivationSpinner:0];
  id v5 = [*(id *)(a1 + 32) explanationView];
  [v5 setShowCheckmark:1];

  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7_73;
  block[3] = &unk_1E59D2A68;
  id v12 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v10 = v7;
  uint64_t v11 = v8;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_7_73(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_9;
  v9[3] = &unk_1E59CB728;
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_9(uint64_t a1)
{
  if ([*(id *)(a1 + 32) eligibility] == 1 && !*(void *)(a1 + 40)) {
    [*(id *)(a1 + 48) setPresentationSource:2];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_12;
  block[3] = &unk_1E59D2A68;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_12(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_14;
  block[3] = &unk_1E59D2A68;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_14(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_16;
  block[3] = &unk_1E59D2A68;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__PKApplyTermsVerifyingViewController__processTerms__block_invoke_16(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_showActivationSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowSpinner:v3];
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v5 _setIdleTimerDisabled:v3 forReason:@"Submitting Application Terms"];

  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"enabled";
    if (v3) {
      id v7 = @"disabled";
    }
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = @"Submitting Application Terms";
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Idle timer is: %@ for reason: %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [v4 dockView];
  [v8 setButtonsEnabled:v3 ^ 1];
}

- (void)_terminateSetupFlow
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  setupDelegate = self->_setupDelegate;
  if (setupDelegate)
  {
    [(PKPaymentSetupViewControllerDelegate *)setupDelegate viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v5 = [(PKApplyTermsVerifyingViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)analyticsPageTag
{
  return (id)*MEMORY[0x1E4F85FA0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyPage, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_setupDelegate, 0);
  objc_storeStrong((id *)&self->_termsIdentifiers, 0);

  objc_destroyWeak((id *)&self->_applyController);
}

@end