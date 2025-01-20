@interface PKApplyExplanationViewController
- (PKApplyController)controller;
- (PKApplyExplanationViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (id)analyticsAdditionalValues;
- (id)analyticsPageTag;
- (id)auxiliaryAction;
- (id)continueAction;
- (id)doneAction;
- (id)learnMoreAction;
- (void)_analyticsReportButtonTap:(id)a3;
- (void)_auxiliary;
- (void)_bodyButtonAction;
- (void)_cancel;
- (void)_continue;
- (void)_done;
- (void)_featureApplicationUpdated;
- (void)_learnMore;
- (void)_linkAction:(id)a3;
- (void)_performActionForBlock:(id)a3;
- (void)_performDoneAction:(BOOL)a3;
- (void)_performLearnMoreAction;
- (void)_presentInvitationContactSupport;
- (void)_presentTermsWithIdentifier:(id)a3;
- (void)handleNextStep;
- (void)handleNextViewController:(id)a3 displayableError:(id)a4;
- (void)setAuxiliaryAction:(id)a3;
- (void)setContinueAction:(id)a3;
- (void)setController:(id)a3;
- (void)setDoneAction:(id)a3;
- (void)setLearnMoreAction:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)showNavigationBarSpinner:(BOOL)a3;
- (void)terminateSetupFlow;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyExplanationViewController

- (PKApplyExplanationViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PKApplyExplanationViewController;
  v14 = [(PKDynamicProvisioningPageViewController *)&v36 initWithPage:v13 context:a5];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_setupDelegate, v12);
    objc_storeStrong((id *)&v15->_controller, a3);
    objc_initWeak(&location, v15);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke;
    v33[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v34, &location);
    v32.receiver = v15;
    v32.super_class = (Class)PKApplyExplanationViewController;
    [(PKDynamicProvisioningPageViewController *)&v32 setPrimaryButtonAction:v33];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_2;
    v30[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v31, &location);
    v29.receiver = v15;
    v29.super_class = (Class)PKApplyExplanationViewController;
    [(PKDynamicProvisioningPageViewController *)&v29 setSecondaryButtonAction:v30];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_3;
    v27[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v28, &location);
    v26.receiver = v15;
    v26.super_class = (Class)PKApplyExplanationViewController;
    [(PKDynamicProvisioningPageViewController *)&v26 setCancelButtonAction:v27];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_4;
    v24[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v25, &location);
    v23.receiver = v15;
    v23.super_class = (Class)PKApplyExplanationViewController;
    [(PKDynamicProvisioningPageViewController *)&v23 setDoneButtonAction:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_5;
    v21[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v22, &location);
    v20.receiver = v15;
    v20.super_class = (Class)PKApplyExplanationViewController;
    [(PKDynamicProvisioningPageViewController *)&v20 setBodyButtonAction:v21];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_6;
    v18[3] = &unk_1E59CC0E8;
    objc_copyWeak(&v19, &location);
    v17.receiver = v15;
    v17.super_class = (Class)PKApplyExplanationViewController;
    [(PKDynamicProvisioningPageViewController *)&v17 setLinkAction:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _continue];
    id WeakRetained = v2;
  }
}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _auxiliary];
    id WeakRetained = v2;
  }
}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancel];
    id WeakRetained = v2;
  }
}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _done];
    id WeakRetained = v2;
  }
}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _learnMore];
    id WeakRetained = v2;
  }
}

void __87__PKApplyExplanationViewController_initWithController_setupDelegate_context_applyPage___block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _linkAction:v5];
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PKApplyExplanationViewController;
  [(PKDynamicProvisioningPageViewController *)&v17 viewDidLoad];
  v3 = [(PKApplyExplanationViewController *)self currentPage];
  v4 = [v3 identifier];

  if (v4)
  {
    id v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
    id v6 = v4;
    v7 = objc_msgSend([v5 alloc], "initWithObjects:", @"newParticipantInvitationAcceptance", @"participantToParticipantInvitationAcceptance", @"participantToCoOwnerInvitationAcceptance", @"newCoOwnerInvitationAcceptance", @"ownerToCoOwnerInvitationAcceptance", 0);
    int v8 = [v7 containsObject:v6];

    if (v8)
    {
      v9 = [(PKExplanationViewController *)self explanationView];
      [v9 setShowPrivacyView:1];
      v10 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 4);
      [(PKExplanationViewController *)self setPrivacyLinkController:v10];

      id v11 = [(PKApplyExplanationViewController *)self navigationItem];
      [v11 setHidesBackButton:0];
    }
  }
  id v12 = [(PKApplyExplanationViewController *)self controller];
  uint64_t v13 = [v12 applicationType];
  if ((unint64_t)(v13 - 2) < 2)
  {
    v14 = [(PKExplanationViewController *)self explanationView];
    v15 = [v14 image];
    if (!v15)
    {
      v16 = PKFeatureApplicationHeaderImageWithImage([v12 featureIdentifier], 0);
      [v14 setImage:v16];
    }
    [v14 setTopMargin:30.0];

    goto LABEL_11;
  }
  if (v13 == 4 && [v12 updateUserInfoSubType] == 4)
  {
    v14 = [(PKExplanationViewController *)self explanationView];
    [v14 setImageStyle:1];
LABEL_11:
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PKApplyExplanationViewController;
  [(PKApplyExplanationViewController *)&v13 viewDidAppear:a3];
  v4 = [(PKApplyExplanationViewController *)self controller];
  [v4 applyFlowDidAppear];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__featureApplicationUpdated name:@"PKApplyControllerUpdatedNotification" object:0];

  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v14 = *MEMORY[0x1E4F86308];
  v15[0] = *MEMORY[0x1E4F864A0];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  int v8 = (void *)[v6 initWithDictionary:v7];

  v9 = [(PKApplyExplanationViewController *)self analyticsAdditionalValues];
  [v8 addEntriesFromDictionary:v9];

  controller = self->_controller;
  id v11 = [(PKApplyExplanationViewController *)self currentPage];
  id v12 = [(PKApplyExplanationViewController *)self analyticsPageTag];
  [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v11 pageTag:v12 additionalValues:v8];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKApplyExplanationViewController;
  [(PKApplyExplanationViewController *)&v12 viewDidDisappear:a3];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"PKApplyControllerUpdatedNotification" object:0];

  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = *MEMORY[0x1E4F86308];
  v14[0] = *MEMORY[0x1E4F864A8];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v7 = (void *)[v5 initWithDictionary:v6];

  int v8 = [(PKApplyExplanationViewController *)self analyticsAdditionalValues];
  [v7 addEntriesFromDictionary:v8];

  controller = self->_controller;
  v10 = [(PKApplyExplanationViewController *)self currentPage];
  id v11 = [(PKApplyExplanationViewController *)self analyticsPageTag];
  [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v10 pageTag:v11 additionalValues:v7];
}

- (id)analyticsPageTag
{
  return (id)*MEMORY[0x1E4F85F60];
}

- (id)analyticsAdditionalValues
{
  return 0;
}

- (void)_continue
{
  [(PKApplyExplanationViewController *)self _analyticsReportButtonTap:*MEMORY[0x1E4F861B8]];
  id continueAction = self->_continueAction;

  [(PKApplyExplanationViewController *)self _performActionForBlock:continueAction];
}

- (void)_auxiliary
{
  [(PKApplyExplanationViewController *)self _analyticsReportButtonTap:*MEMORY[0x1E4F860A0]];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ownerToParticipantImportantInfo", @"coOwnerToParticipantImportantInfo", @"coOwnerToCoOwnerImportantInfo", @"mergeCombinedLimitFailure", @"invitationUnavailable", @"invitationIneligible", 0);
  v3 = [(PKApplyExplanationViewController *)self currentPage];
  v4 = [v3 identifier];
  int v5 = [v6 containsObject:v4];

  if (v5) {
    [(PKApplyExplanationViewController *)self _presentInvitationContactSupport];
  }
  else {
    [(PKApplyExplanationViewController *)self _performActionForBlock:self->_auxiliaryAction];
  }
}

- (void)_learnMore
{
  [(PKApplyExplanationViewController *)self _analyticsReportButtonTap:*MEMORY[0x1E4F865C8]];

  [(PKApplyExplanationViewController *)self _performLearnMoreAction];
}

- (void)_done
{
  [(PKApplyExplanationViewController *)self _analyticsReportButtonTap:*MEMORY[0x1E4F862D0]];

  [(PKApplyExplanationViewController *)self _performDoneAction:1];
}

- (void)_cancel
{
  [(PKApplyExplanationViewController *)self _analyticsReportButtonTap:*MEMORY[0x1E4F86148]];

  [(PKApplyExplanationViewController *)self _performDoneAction:0];
}

- (void)_linkAction:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 linkURL];
  id v6 = [v4 termsIdentifier];
  v7 = [(PKApplyExplanationViewController *)self controller];
  int v8 = [v7 account];

  if (v6)
  {
    if (v8)
    {
      v9 = [PKAccountTermsAndConditionsController alloc];
      v10 = [MEMORY[0x1E4F84D50] sharedService];
      id v11 = [(PKAccountTermsAndConditionsController *)v9 initWithAccount:v8 webService:v10 context:[(PKExplanationViewController *)self context] termsIdentifier:v6];
      termsController = self->_termsController;
      self->_termsController = v11;

      objc_initWeak(location, self);
      uint64_t v13 = self->_termsController;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__PKApplyExplanationViewController__linkAction___block_invoke;
      v19[3] = &unk_1E59CB9C8;
      objc_copyWeak(&v20, location);
      [(PKAccountTermsAndConditionsController *)v13 termsViewControllerWithCompletion:v19];
      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
    }
    else
    {
      objc_super v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", (uint8_t *)location, 0xCu);
      }
    }
  }
  else if (v5)
  {
    uint64_t v14 = [v5 scheme];
    int v15 = [v14 containsString:@"http"];

    if (v15)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v5];
      [v16 setModalPresentationStyle:2];
      [(PKApplyExplanationViewController *)self presentViewController:v16 animated:1 completion:0];
    }
    else
    {
      v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v18 openSensitiveURL:v5 withOptions:0];
    }
  }
}

void __48__PKApplyExplanationViewController__linkAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      int v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else if (v9)
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (void)_analyticsReportButtonTap:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = *MEMORY[0x1E4F86380];
  uint64_t v8 = *MEMORY[0x1E4F86120];
  v15[0] = *MEMORY[0x1E4F86308];
  v15[1] = v8;
  v16[0] = v7;
  v16[1] = v5;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v10 = (void *)[v6 initWithDictionary:v9];

  id v11 = [(PKApplyExplanationViewController *)self analyticsAdditionalValues];
  [v10 addEntriesFromDictionary:v11];

  controller = self->_controller;
  uint64_t v13 = [(PKApplyExplanationViewController *)self currentPage];
  uint64_t v14 = [(PKApplyExplanationViewController *)self analyticsPageTag];
  [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v13 pageTag:v14 additionalValues:v10];
}

- (void)_performActionForBlock:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  uint64_t v7 = v4;
  if (!v4 || (int v5 = v4[2](), v6 = v7, v5))
  {
    [(PKApplyExplanationViewController *)self handleNextStep];
    id v6 = v7;
  }
}

- (void)_performLearnMoreAction
{
  v3 = (uint64_t (**)(void))_Block_copy(self->_learnMoreAction);
  id v6 = v3;
  if (!v3 || (v4 = v3[2](), int v5 = v6, v4))
  {
    [(PKApplyExplanationViewController *)self _bodyButtonAction];
    int v5 = v6;
  }
}

- (void)_performDoneAction:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (uint64_t (**)(void *, BOOL))_Block_copy(self->_doneAction);
  uint64_t v8 = v5;
  if (!v5 || (int v6 = v5[2](v5, v3), v7 = v8, v6))
  {
    [(PKApplyExplanationViewController *)self handleNextStep];
    uint64_t v7 = v8;
  }
}

- (void)handleNextStep
{
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PKApplyExplanationViewController_handleNextStep__block_invoke;
  v4[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v5, &location);
  [(PKApplyController *)controller nextViewControllerWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__PKApplyExplanationViewController_handleNextStep__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNextViewController:v8 displayableError:v5];
  }
}

- (void)handleNextViewController:(id)a3 displayableError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [(PKApplyExplanationViewController *)self navigationController];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke;
    v22[3] = &unk_1E59CB6D8;
    v22[4] = self;
    objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v6, 1, v22);
LABEL_21:

    goto LABEL_22;
  }
  if (v7)
  {
    v10 = [v7 underlyingErrors];
    id v9 = [v10 firstObject];

    id v11 = [v9 domain];
    objc_super v12 = (void *)*MEMORY[0x1E4F870B0];
    id v13 = v11;
    id v14 = v12;
    if (v13 == v14)
    {
    }
    else
    {
      int v15 = v14;
      if (!v13 || !v14)
      {

LABEL_14:
        goto LABEL_15;
      }
      int v16 = [v13 isEqualToString:v14];

      if (!v16) {
        goto LABEL_14;
      }
    }
    uint64_t v17 = [v9 code];

    if (v17 == 1)
    {
      [(PKApplyExplanationViewController *)self showNavigationBarSpinner:0];
      goto LABEL_21;
    }
LABEL_15:
    id v18 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    if (v18)
    {
      id v19 = [(PKApplyExplanationViewController *)self navigationController];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke_2;
      v21[3] = &unk_1E59CA7D0;
      void v21[4] = self;
      [v19 presentViewController:v18 animated:1 completion:v21];
    }
    else
    {
      id v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Error could not generate alertController for: %@", buf, 0xCu);
      }

      [(PKApplyExplanationViewController *)self showNavigationBarSpinner:0];
      [(PKApplyExplanationViewController *)self terminateSetupFlow];
    }

    goto LABEL_21;
  }
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:0];
  [(PKApplyExplanationViewController *)self terminateSetupFlow];
LABEL_22:
}

uint64_t __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showNavigationBarSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 terminateSetupFlow];
  }
  return result;
}

uint64_t __78__PKApplyExplanationViewController_handleNextViewController_displayableError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

- (void)terminateSetupFlow
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v6 = [(PKApplyExplanationViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKApplyExplanationViewController;
  -[PKExplanationViewController showNavigationBarSpinner:](&v8, sel_showNavigationBarSpinner_);
  self->_isLoading = v3;
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v5 _setIdleTimerDisabled:v3 forReason:@"Submitting Application information"];

  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"enabled";
    if (v3) {
      id v7 = @"disabled";
    }
    *(_DWORD *)buf = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    objc_super v12 = @"Submitting Application information";
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Idle timer is: %@ for reason: %@", buf, 0x16u);
  }
}

- (void)_featureApplicationUpdated
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL isLoading = self->_isLoading;
  int v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isLoading)
  {
    if (v5)
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received but current view controller is loading - skipping update", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      objc_super v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received presenting next step", buf, 0xCu);
    }
    v10 = [(PKApplyExplanationViewController *)self controller];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PKApplyExplanationViewController__featureApplicationUpdated__block_invoke;
    v12[3] = &unk_1E59CA7D0;
    v12[4] = self;
    __int16 v11 = [v10 applicationUpdatedAlertControllerWithHandler:v12];

    [(PKApplyExplanationViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __62__PKApplyExplanationViewController__featureApplicationUpdated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNextStep];
}

- (void)_bodyButtonAction
{
  BOOL v3 = [(PKDynamicProvisioningPageViewController *)self page];
  id v18 = [v3 learnMore];

  int v4 = [v18 buttonURL];
  uint64_t v5 = [v18 termsIdentifier];
  id v6 = (void *)v5;
  if (v4)
  {
    id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v7 openURL:v4 configuration:0 completionHandler:0];
  }
  else if (v5)
  {
    [(PKApplyExplanationViewController *)self _presentTermsWithIdentifier:v5];
  }
  else
  {
    objc_super v8 = [[PKPaymentMoreInformationViewController alloc] initWithContext:[(PKExplanationViewController *)self context]];
    id v9 = [v18 title];
    [(PKPaymentMoreInformationViewController *)v8 setDetailTitle:v9];

    v10 = [v18 subtitle];
    [(PKPaymentMoreInformationViewController *)v8 setDetailSubtitle:v10];

    __int16 v11 = [v18 body];
    [(PKPaymentMoreInformationViewController *)v8 setDetailBody:v11];

    objc_super v12 = [v18 businessChatIntentName];
    [(PKPaymentMoreInformationViewController *)v8 setBusinessChatIntentName:v12];

    uint64_t v13 = [v18 businessChatButtonTitle];
    [(PKPaymentMoreInformationViewController *)v8 setBusinessChatButtonTitle:v13];

    id v14 = [(PKApplyController *)self->_controller featureApplication];
    uint64_t v15 = [v14 businessChatIdentifier];
    [(PKPaymentMoreInformationViewController *)v8 setBusinessChatIdentifier:v15];

    int v16 = [[PKNavigationController alloc] initWithRootViewController:v8];
    uint64_t v17 = [(PKApplyExplanationViewController *)self navigationController];
    objc_msgSend(v17, "presentModalViewController:withPaymentSetupContext:", v16, -[PKExplanationViewController context](self, "context"));
  }
}

- (void)_presentTermsWithIdentifier:(id)a3
{
  id v4 = a3;
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
  uint64_t v5 = [PKApplyTermsAndConditionsViewController alloc];
  id v6 = [(PKApplyExplanationViewController *)self controller];
  id v7 = [(PKApplyExplanationViewController *)self setupDelegate];
  objc_super v8 = [(PKApplyTermsAndConditionsViewController *)v5 initWithController:v6 setupDelegate:v7 context:[(PKExplanationViewController *)self context] termsIdentifier:v4];

  [(PKApplyTermsAndConditionsViewController *)v8 setPreflightPDFTerms:1];
  [(PKFeatureTermsAndConditionsViewController *)v8 setUseModalPresentation:1];
  objc_initWeak(&location, self);
  id v9 = [(PKApplyExplanationViewController *)self navigationController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PKApplyExplanationViewController__presentTermsWithIdentifier___block_invoke;
  v10[3] = &unk_1E59CB100;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __64__PKApplyExplanationViewController__presentTermsWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showNavigationBarSpinner:0];
    id WeakRetained = v2;
  }
}

- (void)_presentInvitationContactSupport
{
  if (+[PKBusinessChatController deviceSupportsBusinessChat])
  {
    BOOL v3 = [(PKApplyExplanationViewController *)self controller];
    id v4 = [v3 featureApplication];
    uint64_t v5 = [v4 businessChatIdentifier];

    if (v5)
    {
      if (!self->_businessChatController)
      {
        id v6 = objc_alloc_init(PKBusinessChatController);
        businessChatController = self->_businessChatController;
        self->_businessChatController = v6;
      }
      id v8 = objc_alloc_init(MEMORY[0x1E4F84518]);
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy__51;
      v29[4] = __Block_byref_object_dispose__51;
      id v30 = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke;
      v26[3] = &unk_1E59CDD98;
      id v9 = v3;
      id v27 = v9;
      id v28 = v29;
      [v8 addOperation:v26];
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy__51;
      void v24[4] = __Block_byref_object_dispose__51;
      id v25 = 0;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_3;
      v21[3] = &unk_1E59CDD98;
      id v10 = v9;
      id v22 = v10;
      objc_super v23 = v24;
      [v8 addOperation:v21];
      objc_initWeak(&location, self);
      id v11 = [MEMORY[0x1E4F1CA98] null];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_5;
      v13[3] = &unk_1E59DBD30;
      id v14 = v5;
      uint64_t v17 = v29;
      id v18 = v24;
      id v15 = v10;
      int v16 = self;
      objc_copyWeak(&v19, &location);
      id v12 = (id)[v8 evaluateWithInput:v11 completion:v13];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v29, 8);
    }
  }
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_2;
  v12[3] = &unk_1E59CC850;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 accountUserInvitationsWithCompletion:v12];
}

uint64_t __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_4;
  v12[3] = &unk_1E59CC850;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 featureApplicationsWithCompletion:v12];
}

uint64_t __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [PKBusinessChatInvitationContext alloc];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) account];
  id v11 = [*(id *)(a1 + 40) featureApplication];
  id v12 = [(PKBusinessChatInvitationContext *)v8 initWithBusinessChatIdentifier:v9 account:v10 invitation:v11 pendingInvitations:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) featureApplications:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  id v13 = *(void **)(*(void *)(a1 + 48) + 1112);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_6;
  v14[3] = &unk_1E59CB240;
  objc_copyWeak(&v15, (id *)(a1 + 72));
  [v13 openBusinessChatWithContext:v12 completion:v14];
  objc_destroyWeak(&v15);
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_7;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __68__PKApplyExplanationViewController__presentInvitationContactSupport__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v5 = WeakRetained;
    if (v3)
    {
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v5 presentViewController:v4 animated:1 completion:0];

      id WeakRetained = v5;
    }
    [WeakRetained _continue];
    id WeakRetained = v5;
  }
}

- (PKApplyController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
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

- (id)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
}

- (id)auxiliaryAction
{
  return self->_auxiliaryAction;
}

- (void)setAuxiliaryAction:(id)a3
{
}

- (id)learnMoreAction
{
  return self->_learnMoreAction;
}

- (void)setLearnMoreAction:(id)a3
{
}

- (id)doneAction
{
  return self->_doneAction;
}

- (void)setDoneAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneAction, 0);
  objc_storeStrong(&self->_learnMoreAction, 0);
  objc_storeStrong(&self->_auxiliaryAction, 0);
  objc_storeStrong(&self->_continueAction, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_termsController, 0);

  objc_storeStrong((id *)&self->_businessChatController, 0);
}

@end