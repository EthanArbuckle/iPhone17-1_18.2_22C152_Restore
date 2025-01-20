@interface PKPayLaterSetupFlowController
+ (id)defaultPayLaterSetupFlowControllerForAccount:(id)a3 controllerContext:(int64_t)a4 referrerIdentifier:(id)a5;
+ (id)payLaterSetupFlowControllerForAccount:(id)a3 controllerContext:(int64_t)a4 referrerIdentifier:(id)a5 paymentWebService:(id)a6 accountService:(id)a7 peerPaymentService:(id)a8 paymentService:(id)a9 passLibrary:(id)a10;
- (BOOL)_didStartPayLaterPassProvisioning;
- (BOOL)hasPayLaterPass;
- (NSString)referrerIdentifier;
- (PKPayLaterFinancingController)financingController;
- (PKPayLaterFinancingOption)selectedFinancingOption;
- (PKPayLaterPreliminaryAssessment)selectedPreliminaryAssessment;
- (PKPayLaterSetupFlowController)initWithFinancingController:(id)a3 controllerContext:(int64_t)a4 selectedFinancingOption:(id)a5 selectedPreliminaryAssessment:(id)a6 referrerIdentifier:(id)a7;
- (PKPayLaterSetupFlowControllerDelegate)delegate;
- (PKPaymentSetupViewControllerDelegate)setupViewControllerDelegate;
- (id)_firstViewControllerWithoutNavController;
- (id)_genericError;
- (id)firstViewController;
- (id)localizedBundle;
- (id)payLaterPassUniqueIdentifier;
- (id)preferredLanguage;
- (id)snapshotForPass:(id)a3 completion:(id)a4;
- (int64_t)controllerContext;
- (int64_t)setupContext;
- (unint64_t)selectedProductType;
- (void)_acceptTermsIdentifier:(id)a3 completion:(id)a4;
- (void)_callNextViewControllerCompletionBlockWithError:(id)a3;
- (void)_checkSecurityCapabiltiesWithCompletion:(id)a3;
- (void)_nextApplyViewControllerWithCompletion:(id)a3;
- (void)_updatePayLaterPass;
- (void)_viewControllerForState:(int64_t)a3 completion:(id)a4;
- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4;
- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4;
- (void)endSetupFlowFromViewController:(id)a3 shouldDismiss:(BOOL)a4;
- (void)fetchPayLaterDynamicContentWithCompletion:(id)a3;
- (void)nextViewControllerFromState:(int64_t)a3 parentViewController:(id)a4 completion:(id)a5;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)provisionPayLaterPassWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedFinancingOption:(id)a3;
- (void)setSelectedPreliminaryAssessment:(id)a3;
- (void)setSetupViewControllerDelegate:(id)a3;
- (void)termsViewControllerForTermsIdentifier:(id)a3 completion:(id)a4;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation PKPayLaterSetupFlowController

- (PKPayLaterSetupFlowController)initWithFinancingController:(id)a3 controllerContext:(int64_t)a4 selectedFinancingOption:(id)a5 selectedPreliminaryAssessment:(id)a6 referrerIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  v15 = (PKPayLaterPreliminaryAssessment *)a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterSetupFlowController;
  v17 = [(PKPayLaterSetupFlowController *)&v21 init];
  if (v17)
  {
    v18 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v17->_snapshotter;
    v17->_snapshotter = v18;

    v17->_controllerContext = a4;
    objc_storeStrong((id *)&v17->_selectedFinancingOption, a5);
    v17->_selectedPreliminaryAssessment = v15;
    objc_storeStrong((id *)&v17->_financingController, a3);
    objc_storeStrong((id *)&v17->_referrerIdentifier, a7);
    [(PKPayLaterFinancingController *)v17->_financingController setReferrerIdentifier:v17->_referrerIdentifier];
    if ((unint64_t)a4 <= 4) {
      v17->_setupContext = qword_1A04430F8[a4];
    }
    [(PKPayLaterSetupFlowController *)v17 _updatePayLaterPass];
  }

  return v17;
}

+ (id)defaultPayLaterSetupFlowControllerForAccount:(id)a3 controllerContext:(int64_t)a4 referrerIdentifier:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F84D50];
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 sharedService];
  v12 = [MEMORY[0x1E4F84270] sharedInstance];
  id v13 = [MEMORY[0x1E4F84E00] sharedInstance];
  id v14 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  v15 = [MEMORY[0x1E4F84898] sharedInstance];
  id v16 = [a1 payLaterSetupFlowControllerForAccount:v10 controllerContext:a4 referrerIdentifier:v9 paymentWebService:v11 accountService:v12 peerPaymentService:v13 paymentService:v14 passLibrary:v15];

  return v16;
}

+ (id)payLaterSetupFlowControllerForAccount:(id)a3 controllerContext:(int64_t)a4 referrerIdentifier:(id)a5 paymentWebService:(id)a6 accountService:(id)a7 peerPaymentService:(id)a8 paymentService:(id)a9 passLibrary:(id)a10
{
  if ((unint64_t)a4 > 3) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = qword_1A0443120[a4];
  }
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  v23 = [v22 payLaterDetails];
  v24 = [v23 currencyCode];

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F84988]) initWithCurrencyCode:v24 channel:v15];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F84980]) initWithAccountService:v19 paymentService:v17 peerPaymentService:v18 paymentWebService:v20 passLibrary:v16 payLaterAccount:v22 configuration:v25];

  v27 = [[PKPayLaterSetupFlowController alloc] initWithFinancingController:v26 controllerContext:a4 selectedFinancingOption:0 selectedPreliminaryAssessment:0 referrerIdentifier:v21];

  return v27;
}

- (void)fetchPayLaterDynamicContentWithCompletion:(id)a3
{
  [(PKPayLaterFinancingController *)self->_financingController fetchPayLaterDynamicContentForType:(self->_controllerContext & 0xFFFFFFFFFFFFFFFELL) == 2 completion:a3];
}

- (id)firstViewController
{
  uint64_t v3 = [(PKPayLaterSetupFlowController *)self _firstViewControllerWithoutNavController];
  if (v3)
  {
    v4 = (void *)v3;
    int64_t controllerContext = self->_controllerContext;
    BOOL v6 = (unint64_t)(controllerContext - 3) < 2 || controllerContext == 1;
    if (!v6 && (controllerContext || (PKOslo2024UIUpdatesEnabled() & 1) != 0)) {
      goto LABEL_10;
    }
    v7 = [[PKNavigationController alloc] initWithRootViewController:v4];
  }
  else
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
    v7 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
  }
  v8 = v7;

  v4 = v8;
LABEL_10:

  return v4;
}

- (id)_firstViewControllerWithoutNavController
{
  selectedFinancingOption = self->_selectedFinancingOption;
  if (selectedFinancingOption)
  {
    if ([(PKPayLaterFinancingOption *)selectedFinancingOption productType] == 1)
    {
      v4 = [[PKPayLaterPaymentScheduleViewController alloc] initWithSetupFlowController:self dynamicContentPageType:4];
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  selectedPreliminaryAssessment = self->_selectedPreliminaryAssessment;
  if (selectedPreliminaryAssessment)
  {
    if ([(PKPayLaterPreliminaryAssessment *)selectedPreliminaryAssessment productType] == 1)
    {
      int64_t controllerContext = self->_controllerContext;
      if ((unint64_t)(controllerContext - 1) < 3)
      {
LABEL_10:
        v7 = PKPayLaterLoadingViewController;
LABEL_17:
        v4 = (PKPayLaterPaymentScheduleViewController *)[[v7 alloc] initWithSetupFlowController:self];
        goto LABEL_21;
      }
      if (!controllerContext || controllerContext == 4)
      {
        if ([(PKPayLaterPreliminaryAssessment *)self->_selectedPreliminaryAssessment isReapplication])goto LABEL_10; {
LABEL_16:
        }
        v7 = PKPayLaterExplanationViewController;
        goto LABEL_17;
      }
    }
  }
  else
  {
    unint64_t v8 = self->_controllerContext;
    if (v8 < 3 || v8 == 4) {
      goto LABEL_16;
    }
    if (v8 == 3)
    {
      v7 = PKPayLaterEnterAmountSetupViewController;
      goto LABEL_17;
    }
  }
LABEL_20:
  v4 = 0;
LABEL_21:

  return v4;
}

- (void)nextViewControllerFromState:(int64_t)a3 parentViewController:(id)a4 completion:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 0xA) {
      v12 = @"unknown";
    }
    else {
      v12 = off_1E59CD4A8[a3];
    }
    *(_DWORD *)buf = 138412290;
    v54 = v12;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPayLaterSetupFlowController nextViewControllerFromState: %@", buf, 0xCu);
  }

  if (v10)
  {
    objc_storeStrong((id *)&self->_parentViewController, a4);
    switch(a3)
    {
      case 0:
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke;
        v51[3] = &unk_1E59CD2D0;
        v51[4] = self;
        id v52 = v10;
        [(PKPayLaterSetupFlowController *)self _checkSecurityCapabiltiesWithCompletion:v51];

        break;
      case 1:
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_2;
        v49[3] = &unk_1E59CD2D0;
        v49[4] = self;
        id v50 = v10;
        [(PKPayLaterSetupFlowController *)self _checkSecurityCapabiltiesWithCompletion:v49];

        break;
      case 2:
        int64_t controllerContext = self->_controllerContext;
        if ((unint64_t)(controllerContext - 1) >= 3)
        {
          if (!controllerContext || controllerContext == 4) {
            goto LABEL_22;
          }
        }
        else
        {
          [(PKPayLaterSetupFlowController *)self _viewControllerForState:3 completion:v10];
        }
        break;
      case 3:
        objc_initWeak((id *)buf, self);
        financingController = self->_financingController;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_3;
        v46[3] = &unk_1E59CD2F8;
        objc_copyWeak(&v48, (id *)buf);
        id v47 = v10;
        [(PKPayLaterFinancingController *)financingController updateFinancingOptionsWithCompletion:v46];

        objc_destroyWeak(&v48);
        objc_destroyWeak((id *)buf);
        break;
      case 4:
        selectedFinancingOption = self->_selectedFinancingOption;
        if (selectedFinancingOption)
        {
          int64_t v16 = self->_controllerContext;
          if ((unint64_t)(v16 - 1) >= 3)
          {
            if (!v16 || v16 == 4)
            {
              uint64_t v33 = [(PKPayLaterFinancingOption *)selectedFinancingOption productType];
              if (!v33) {
                goto LABEL_22;
              }
              if (v33 == 1) {
                [(PKPayLaterSetupFlowController *)self _viewControllerForState:6 completion:v10];
              }
            }
          }
          else
          {
            [(PKPayLaterSetupFlowController *)self _viewControllerForState:9 completion:v10];
          }
        }
        else
        {
          selectedPreliminaryAssessment = self->_selectedPreliminaryAssessment;
          if (selectedPreliminaryAssessment)
          {
            uint64_t v29 = [(PKPayLaterPreliminaryAssessment *)selectedPreliminaryAssessment productType];
            if (!v29) {
              goto LABEL_22;
            }
            if (v29 == 1)
            {
              v30 = [(PKPayLaterSetupFlowController *)self _firstViewControllerWithoutNavController];
              (*((void (**)(id, void *, void))v10 + 2))(v10, v30, 0);
            }
          }
        }
        break;
      case 5:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_5;
        aBlock[3] = &unk_1E59CD320;
        id v17 = v10;
        id v45 = v17;
        id v18 = _Block_copy(aBlock);
        id v19 = self->_selectedFinancingOption;
        if (v19)
        {
          int64_t v20 = self->_controllerContext;
          if ((unint64_t)(v20 - 1) < 3)
          {
LABEL_18:
            [(PKPayLaterSetupFlowController *)self _viewControllerForState:9 completion:v18];
            goto LABEL_65;
          }
          if (v20 && v20 != 4) {
            goto LABEL_65;
          }
          uint64_t v34 = [(PKPayLaterFinancingOption *)v19 productType];
          if (v34)
          {
            if (v34 == 1) {
              [(PKPayLaterSetupFlowController *)self _viewControllerForState:6 completion:v18];
            }
LABEL_65:

            break;
          }
        }
        else
        {
          v31 = self->_selectedPreliminaryAssessment;
          if (!v31) {
            goto LABEL_65;
          }
          int64_t v32 = self->_controllerContext;
          if ((unint64_t)(v32 - 1) < 3) {
            goto LABEL_18;
          }
          if (v32)
          {
            if (v32 != 4) {
              goto LABEL_65;
            }
          }
          else if ((unint64_t)[(PKPayLaterPreliminaryAssessment *)v31 productType] > 1)
          {
            goto LABEL_65;
          }
        }
        v37 = [(PKPayLaterSetupFlowController *)self _genericError];
        (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v37);

        goto LABEL_65;
      case 6:
        uint64_t v21 = [(PKPayLaterFinancingOption *)self->_selectedFinancingOption productType];
        if (!v21) {
          goto LABEL_22;
        }
        if (v21 == 1)
        {
          int64_t v22 = self->_controllerContext;
          if ((unint64_t)(v22 - 1) < 4) {
            goto LABEL_22;
          }
          if (!v22)
          {
            objc_initWeak((id *)buf, self);
            v35 = [(PKPayLaterFinancingOption *)self->_selectedFinancingOption termsDetails];
            v36 = [v35 installmentAgreementIdentifier];

            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_6;
            v41[3] = &unk_1E59CD348;
            objc_copyWeak(&v43, (id *)buf);
            id v42 = v10;
            [(PKPayLaterSetupFlowController *)self _acceptTermsIdentifier:v36 completion:v41];

            objc_destroyWeak(&v43);
            objc_destroyWeak((id *)buf);
          }
        }
        break;
      case 7:
        v24 = self->_selectedFinancingOption;
        if (v24)
        {
          uint64_t v25 = [(PKPayLaterFinancingOption *)v24 productType];
          if (!v25) {
            goto LABEL_22;
          }
          if (v25 == 1)
          {
            objc_initWeak((id *)buf, self);
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_7;
            v38[3] = &unk_1E59CD348;
            objc_copyWeak(&v40, (id *)buf);
            id v39 = v10;
            v26 = _Block_copy(v38);
            id nextViewControllerCompletion = self->_nextViewControllerCompletion;
            self->_id nextViewControllerCompletion = v26;

            if (![(PKPayLaterSetupFlowController *)self _didStartPayLaterPassProvisioning])[(PKPayLaterSetupFlowController *)self _callNextViewControllerCompletionBlockWithError:0]; {
            objc_destroyWeak(&v40);
            }
            objc_destroyWeak((id *)buf);
          }
        }
        break;
      case 8:
        if ((unint64_t)[(PKPayLaterFinancingOption *)self->_selectedFinancingOption productType] <= 1)
        {
LABEL_22:
          v23 = [(PKPayLaterSetupFlowController *)self _genericError];
          (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);
        }
        break;
      case 9:
        [(PKPayLaterSetupFlowController *)self _viewControllerForState:10 completion:v10];
        break;
      case 10:
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
        break;
      default:
        break;
    }
  }
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v21 = v5;
  if (a2)
  {
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 10;
LABEL_3:
    [v6 _viewControllerForState:v8 completion:v7];
    goto LABEL_6;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(void *)(v9 + 152))
  {
    if (!*(void *)(v9 + 160))
    {
      uint64_t v14 = *(void *)(v9 + 128);
      if ((unint64_t)(v14 - 1) >= 3)
      {
        if (v14) {
          BOOL v18 = v14 == 4;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18)
        {
          uint64_t v19 = *(void *)(a1 + 40);
          int64_t v20 = objc_msgSend((id)v9, "_genericError", 0);
          (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
        }
      }
      else
      {
        uint64_t v15 = objc_msgSend(*(id *)(v9 + 112), "dynamicContent", 0);
        int64_t v16 = [v15 dynamicContentPageForPageType:9];

        if (v16) {
          uint64_t v17 = 2;
        }
        else {
          uint64_t v17 = 3;
        }
        [*(id *)(a1 + 32) _viewControllerForState:v17 completion:*(void *)(a1 + 40)];
      }
      goto LABEL_6;
    }
    uint64_t v11 = objc_msgSend(*(id *)(v9 + 160), "productType", 0);
    if (v11)
    {
      if (v11 == 1)
      {
        BOOL v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = 5;
        goto LABEL_3;
      }
      goto LABEL_6;
    }
LABEL_17:
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [*(id *)(a1 + 32) _genericError];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);

    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend(*(id *)(v9 + 152), "productType", 0);
  if (!v10) {
    goto LABEL_17;
  }
  if (v10 == 1)
  {
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 6;
    goto LABEL_3;
  }
LABEL_6:
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v16 = v5;
  if (a2)
  {
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 10;
LABEL_3:
    [v6 _viewControllerForState:v8 completion:v7];
    goto LABEL_6;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 152);
  if (!v10)
  {
    uint64_t v12 = *(void **)(v9 + 160);
    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v13 = objc_msgSend(v12, "productType", 0);
    if (v13)
    {
      if (v13 == 1)
      {
        BOOL v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = 5;
        goto LABEL_3;
      }
      goto LABEL_6;
    }
LABEL_17:
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [*(id *)(a1 + 32) _genericError];
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);

    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend(v10, "productType", 0);
  if (!v11) {
    goto LABEL_17;
  }
  if (v11 == 1)
  {
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 6;
    goto LABEL_3;
  }
LABEL_6:
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_4;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = WeakRetained;
    if (*(void *)(a1 + 32)) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
    else {
      [WeakRetained _viewControllerForState:4 completion:v3];
    }
    id WeakRetained = v4;
  }
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setPreviousViewControllerIsApplyFlow:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void, void))(v5 + 16))(*(void *)(a1 + 32), 0);
    }
    else {
      [WeakRetained _viewControllerForState:7 completion:v5];
    }
  }
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v6 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v5 = objc_loadWeakRetained((id *)WeakRetained + 13);
      [v5 payLaterSetupFlowController:v4 didSelect:v4[19]];

      [v4 _viewControllerForState:10 completion:*(void *)(a1 + 32)];
    }
  }
}

- (BOOL)hasPayLaterPass
{
  uint64_t v3 = [(PKPayLaterSetupFlowController *)self payLaterPassUniqueIdentifier];
  if (v3)
  {
    id v4 = [(PKPayLaterFinancingController *)self->_financingController passLibrary];
    id v5 = [v4 passWithUniqueID:v3];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)payLaterPassUniqueIdentifier
{
  v2 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
  uint64_t v3 = [v2 associatedPassUniqueID];

  return v3;
}

- (void)provisionPayLaterPassWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (v4)
  {
    if ([(PKPayLaterSetupFlowController *)self hasPayLaterPass])
    {
      v4[2](v4, 1, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PKPayLaterSetupFlowController_provisionPayLaterPassWithCompletion___block_invoke;
      aBlock[3] = &unk_1E59CD348;
      objc_copyWeak(&v10, &location);
      id v9 = v4;
      id v5 = _Block_copy(aBlock);
      id nextViewControllerCompletion = self->_nextViewControllerCompletion;
      self->_id nextViewControllerCompletion = v5;

      if (![(PKPayLaterSetupFlowController *)self _didStartPayLaterPassProvisioning])
      {
        id v7 = [(PKPayLaterSetupFlowController *)self _genericError];
        [(PKPayLaterSetupFlowController *)self _callNextViewControllerCompletionBlockWithError:v7];
      }
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __69__PKPayLaterSetupFlowController_provisionPayLaterPassWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)_didStartPayLaterPassProvisioning
{
  if (self->_payLaterPass) {
    return 0;
  }
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Provisioning the pay later pass...", buf, 2u);
  }

  id v5 = objc_alloc(MEMORY[0x1E4F84BB8]);
  BOOL v6 = [(PKPayLaterFinancingController *)self->_financingController paymentWebService];
  id v7 = (void *)[v5 initWithWebService:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F841C8]);
  id v9 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
  id v10 = (void *)[v8 initWithAccount:v9];

  [v10 setPaymentPass:self->_payLaterPass];
  BOOL v2 = v10 != 0;
  if (v10)
  {
    uint64_t v11 = [[PKAccountFlowController alloc] initWithAccountCredential:v10 provisioningController:v7 setupDelegate:0 context:self->_setupContext operations:1];
    accountFlowController = self->_accountFlowController;
    self->_accountFlowController = v11;

    [(PKAccountFlowController *)self->_accountFlowController setDelegate:self];
    [(PKAccountFlowController *)self->_accountFlowController performInitalOperations];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Cannot present pay later provisioning flow with a nil account credential", v14, 2u);
    }
  }
  return v2;
}

- (void)_updatePayLaterPass
{
  id v8 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
  uint64_t v3 = [(PKPayLaterFinancingController *)self->_financingController passLibrary];
  id v4 = [v8 associatedPassUniqueID];
  id v5 = [v3 passWithUniqueID:v4];
  BOOL v6 = [v5 paymentPass];
  payLaterPass = self->_payLaterPass;
  self->_payLaterPass = v6;

  [(PKPayLaterFinancingController *)self->_financingController setPayLaterPass:self->_payLaterPass];
}

- (id)snapshotForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [v6 style];
    PKPassFrontFaceContentSize();
    PKSizeAspectFit();
    double v9 = v8;
    double v11 = v10;
    objc_initWeak(&location, self);
    snapshotter = self->_snapshotter;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke;
    v14[3] = &unk_1E59CBBA8;
    objc_copyWeak(&v16, &location);
    id v15 = v7;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](snapshotter, "snapshotWithPass:size:completion:", v6, v14, v9, v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return 0;
}

void __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke_2;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = WeakRetained;
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
      id WeakRetained = v4;
    }
  }
}

- (void)termsViewControllerForTermsIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      id v9 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
      double v10 = [PKAccountTermsAndConditionsController alloc];
      double v11 = [(PKPayLaterFinancingController *)self->_financingController paymentWebService];
      uint64_t v12 = [(PKAccountTermsAndConditionsController *)v10 initWithAccount:v9 webService:v11 context:self->_setupContext termsIdentifier:v6];
      termsController = self->_termsController;
      self->_termsController = v12;

      uint64_t v14 = self->_termsController;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __82__PKPayLaterSetupFlowController_termsViewControllerForTermsIdentifier_completion___block_invoke;
      v15[3] = &unk_1E59CD320;
      id v16 = v8;
      [(PKAccountTermsAndConditionsController *)v14 termsViewControllerWithCompletion:v15];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

uint64_t __82__PKPayLaterSetupFlowController_termsViewControllerForTermsIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    a2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)_acceptTermsIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
      PKLogFacilityTypeGetObject();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19F450000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "request:payLaterTerms", "", buf, 2u);
        }
      }

      uint64_t v12 = [(PKPayLaterFinancingController *)self->_financingController accountService];
      uint64_t v13 = [v8 accountIdentifier];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke;
      v15[3] = &unk_1E59CD370;
      void v15[4] = self;
      id v16 = v7;
      [v12 termsWithIdentifier:v6 accepted:1 withAccountIdentifier:v13 completion:v15];
    }
    else
    {
      uint64_t v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Errror: cannot accept terms for a nil terms identifier", buf, 2u);
      }

      id v8 = [(PKPayLaterSetupFlowController *)self _genericError];
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }
  }
}

void __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E59CA938;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke_2(uint64_t a1)
{
  PKLogFacilityTypeGetObject();
  BOOL v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)id v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v2, OS_SIGNPOST_INTERVAL_END, v4, "request:payLaterTerms", "", v6, 2u);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)localizedBundle
{
  localizedBundle = self->_localizedBundle;
  if (!localizedBundle)
  {
    os_signpost_id_t v4 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
    +[PKApplyController localizationBundleForFeatureIdentifier:account:](PKApplyController, "localizationBundleForFeatureIdentifier:account:", [v4 feature], v4);
    id v5 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_localizedBundle;
    self->_localizedBundle = v5;

    localizedBundle = self->_localizedBundle;
  }

  return localizedBundle;
}

- (id)preferredLanguage
{
  preferredLanguage = self->_preferredLanguage;
  if (!preferredLanguage)
  {
    os_signpost_id_t v4 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
    +[PKApplyController preferredLanguageForFeatureIdentifier:account:](PKApplyController, "preferredLanguageForFeatureIdentifier:account:", [v4 feature], v4);
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_preferredLanguage;
    self->_preferredLanguage = v5;

    preferredLanguage = self->_preferredLanguage;
  }

  return preferredLanguage;
}

- (void)endSetupFlowFromViewController:(id)a3 shouldDismiss:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v4) {
      id v8 = @"YES";
    }
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterSetupFlowController endSetupFlow from %@, should dismiss: %@", (uint8_t *)&v12, 0x16u);
  }

  [(PKApplyController *)self->_applyController endApplyFlow];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      os_signpost_id_t v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 payLaterSetupFlowControllerDidFinish:self];
    }
    else
    {
      os_signpost_id_t v11 = [v6 presentingViewController];
      [v11 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfViewController___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __92__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callNextViewControllerCompletionBlockWithError:0];
}

- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfDisplayableError___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __94__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfDisplayableError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callNextViewControllerCompletionBlockWithError:*(void *)(a1 + 40)];
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t lastFeatureApplicationState = self->_lastFeatureApplicationState;
  if (!lastFeatureApplicationState)
  {
    id v6 = [(PKApplyController *)self->_applyController featureApplication];
    unint64_t lastFeatureApplicationState = [v6 applicationState];
  }
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = PKFeatureApplicationStateToString();
    int v10 = 138412290;
    os_signpost_id_t v11 = v8;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Apply flow did terminate with final application state %@", (uint8_t *)&v10, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained payLaterSetupFlowController:self didTerminateApplicationState:lastFeatureApplicationState];

  [(PKPayLaterSetupFlowController *)self endSetupFlowFromViewController:v4 shouldDismiss:1];
}

- (unint64_t)selectedProductType
{
  unint64_t result = (unint64_t)self->_selectedFinancingOption;
  if (result) {
    return [(id)result productType];
  }
  unint64_t result = (unint64_t)self->_selectedPreliminaryAssessment;
  if (result) {
    return [(id)result productType];
  }
  return result;
}

- (void)_viewControllerForState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v15 = v6;
    switch(a3)
    {
      case 0:
        id v8 = PKPayLaterExplanationViewController;
        goto LABEL_12;
      case 1:
        id v8 = PKPayLaterLoadingViewController;
        goto LABEL_12;
      case 2:
        id v8 = PKPayLaterMoreInformationViewController;
        goto LABEL_12;
      case 3:
        id v8 = PKPayLaterEnterAmountSetupViewController;
        goto LABEL_12;
      case 4:
        id v9 = [PKPayLaterProductOptionsViewController alloc];
        int v10 = self;
        uint64_t v11 = 6;
        goto LABEL_15;
      case 5:
        [(PKPayLaterSetupFlowController *)self _nextApplyViewControllerWithCompletion:v6];
        goto LABEL_17;
      case 6:
        id v9 = [PKPayLaterPaymentScheduleViewController alloc];
        int v10 = self;
        uint64_t v11 = 4;
        goto LABEL_15;
      case 7:
        id v8 = PKPayLaterFundingSourceViewController;
        goto LABEL_12;
      case 8:
        id v8 = PKPayLaterReviewPlanViewController;
LABEL_12:
        uint64_t v12 = [[v8 alloc] initWithSetupFlowController:self];
        goto LABEL_16;
      case 9:
        unint64_t v13 = [(PKPayLaterSetupFlowController *)self selectedProductType];
        id v7 = v15;
        if (v13 != 1) {
          break;
        }
        id v9 = [PKPayLaterPaymentScheduleViewController alloc];
        int v10 = self;
        uint64_t v11 = 11;
LABEL_15:
        uint64_t v12 = [(PKPayLaterProductOptionsViewController *)v9 initWithSetupFlowController:v10 dynamicContentPageType:v11];
LABEL_16:
        __int16 v14 = (void *)v12;
        (*((void (**)(id, uint64_t, void))v15 + 2))(v15, v12, 0);

LABEL_17:
        id v7 = v15;
        break;
      case 10:
        (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
        goto LABEL_17;
      default:
        break;
    }
  }
}

- (void)_checkSecurityCapabiltiesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_meetsSecurityCheck)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "User meets pay later security capabailties.", buf, 2u);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
    else
    {
      securityCapabiltiesController = self->_securityCapabiltiesController;
      if (securityCapabiltiesController)
      {
        id v7 = securityCapabiltiesController;
        id v8 = self->_securityCapabiltiesController;
        self->_securityCapabiltiesController = v7;
      }
      else
      {
        id v9 = [PKSecurityCapabilitiesController alloc];
        id v8 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
        int v10 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:](v9, "initWithRequirements:feature:context:", 4, [v8 feature], self->_setupContext);
        uint64_t v11 = self->_securityCapabiltiesController;
        self->_securityCapabiltiesController = v10;
      }
      uint64_t v12 = self->_securityCapabiltiesController;
      parentViewController = self->_parentViewController;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke;
      v14[3] = &unk_1E59CD3C0;
      void v14[4] = self;
      id v15 = v4;
      [(PKSecurityCapabilitiesController *)v12 presentSecurityRepairFlowWithPresentingViewController:parentViewController completion:v14];
    }
  }
}

void __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke_2;
  v9[3] = &unk_1E59CD398;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v12 = a2;
  v9[4] = v6;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[7];
  if (v1 == 3)
  {
    BOOL v2 = *(uint64_t (**)(void))(a1[6] + 16);
    return v2();
  }
  if (!v1)
  {
    *(unsigned char *)(a1[4] + 80) = 1;
    BOOL v2 = *(uint64_t (**)(void))(a1[6] + 16);
    return v2();
  }
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], 0, a1[5]);
}

- (void)_nextApplyViewControllerWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    id v5 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
    uint64_t v6 = [v5 applyServiceURL];
    unint64_t v7 = [(PKPayLaterSetupFlowController *)self selectedProductType];
    if (v6)
    {
      unint64_t v8 = v7;
      if (v7)
      {
        id v9 = [(PKPayLaterFinancingController *)self->_financingController assessmentCollection];
        id v10 = [v9 productAssessmentForProductType:v8];

        id v11 = [v10 preliminaryAssessment];
        if (v11)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F84BB8]);
          unint64_t v13 = [(PKPayLaterFinancingController *)self->_financingController paymentWebService];
          __int16 v14 = (void *)[v12 initWithWebService:v13];

          [v14 setReferrerIdentifier:self->_referrerIdentifier];
          id v15 = [[PKApplyControllerConfiguration alloc] initWithSetupDelegate:self context:self->_setupContext provisioningController:v14];
          -[PKApplyControllerConfiguration setFeature:](v15, "setFeature:", [v5 feature]);
          -[PKApplyControllerConfiguration setFeatureProduct:](v15, "setFeatureProduct:", [v11 productType] == 1);
          [(PKApplyControllerConfiguration *)v15 setAccount:v5];
          self->_unint64_t lastFeatureApplicationState = 0;
          uint64_t v16 = [[PKApplyController alloc] initWithApplyConfiguration:v15];
          applyController = self->_applyController;
          self->_applyController = v16;

          [(PKApplyController *)self->_applyController setParentFlowController:self];
          [(PKApplyController *)self->_applyController setApplyServiceURL:v6];
          BOOL v18 = self->_applyController;
          uint64_t v19 = [v11 identifier];
          [(PKApplyController *)v18 setPreliminaryAssessmentIdentifier:v19];

          [(PKApplyController *)self->_applyController setPayLaterSetupController:self];
          [(PKApplyController *)self->_applyController nextViewControllerWithCompletion:v4];
        }
        else
        {
          int64_t v22 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = PKPayLaterAccountProductTypeToString();
            int v25 = 138412290;
            v26 = v23;
            _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Error: Cannot apply when there is no priminary assessment for product type %@", (uint8_t *)&v25, 0xCu);
          }
          v24 = [(PKPayLaterSetupFlowController *)self _genericError];
          v4[2](v4, 0, v24);
        }
        goto LABEL_16;
      }
      int64_t v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        id v21 = "Error: Cannot apply when there is no selected product type";
        goto LABEL_10;
      }
    }
    else
    {
      int64_t v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        id v21 = "Error: Cannot create pay later controller without apply service URL";
LABEL_10:
        _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, 2u);
      }
    }

    id v10 = [(PKPayLaterSetupFlowController *)self _genericError];
    v4[2](v4, 0, v10);
LABEL_16:
  }
}

- (void)_callNextViewControllerCompletionBlockWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  objc_initWeak(&location, self);
  if (!v4)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Force updating the pay later account after provisioning.", buf, 2u);
    }

    unint64_t v7 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
    unint64_t v8 = [v7 accountIdentifier];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke;
    v16[3] = &unk_1E59CD438;
    v16[4] = self;
    id v9 = v8;
    id v17 = v9;
    objc_copyWeak(&v18, &location);
    [v5 addOperation:v16];
    objc_destroyWeak(&v18);
  }
  id v10 = [MEMORY[0x1E4F1CA98] null];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_4;
  v13[3] = &unk_1E59CD460;
  objc_copyWeak(&v15, &location);
  v13[4] = self;
  id v11 = v4;
  id v14 = v11;
  id v12 = (id)[v5 evaluateWithInput:v10 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(*(void *)(a1 + 32) + 112) accountService];
  uint64_t v11 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_2;
  v14[3] = &unk_1E59CD410;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v10 updateAccountWithIdentifier:v11 extended:0 completion:v14];

  objc_destroyWeak(&v17);
}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_3;
  block[3] = &unk_1E59CD3E8;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v6;
  id v11 = v5;
  id v13 = a1[5];
  id v12 = a1[4];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    os_signpost_id_t v3 = WeakRetained;
    if (!*(void *)(a1 + 32) && *(void *)(a1 + 40)) {
      objc_msgSend(WeakRetained[14], "setPayLaterAccount:");
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id WeakRetained = v3;
  }
}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_4(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [*(id *)(a1 + 32) _updatePayLaterPass];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 96) + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = 0;

    id WeakRetained = v5;
  }
}

- (id)_genericError
{
  BOOL v2 = PKLocalizedPaymentString(&cfstr_GenericErrorTi.isa);
  uint64_t v3 = PKLocalizedPaymentString(&cfstr_GenericErrorMe.isa);
  id v4 = PKDisplayableErrorCustom();

  return v4;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKApplyController *)self->_applyController featureApplication];
  self->_unint64_t lastFeatureApplicationState = [v5 applicationState];

  BOOL v6 = [(PKApplyController *)self->_applyController didEncounterError];
  id v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "The pay later apply flow encountered an error, not updating financing options", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Updating financing options after a finished application.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    financingController = self->_financingController;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke;
    v10[3] = &unk_1E59CD488;
    objc_copyWeak(&v12, buf);
    v10[4] = self;
    id v11 = v4;
    [(PKPayLaterFinancingController *)financingController updateFinancingOptionsWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

void __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v6 = (id *)WeakRetained;
  if (!WeakRetained) {
    goto LABEL_16;
  }
  if (v4)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v4;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error: updating the financing options %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v6 _genericError];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    goto LABEL_6;
  }
  unint64_t v10 = *((void *)WeakRetained + 11);
  if (v10 - 9 >= 8 && (v10 > 7 || ((1 << v10) & 0xA1) == 0))
  {
    BOOL v15 = [*((id *)WeakRetained + 1) featureProduct] == 1;
    id v16 = [v6[14] assessmentCollection];
    id v9 = [v16 productAssessmentForProductType:v15];

    id v17 = [v9 financingOptions];
    if ([v17 count])
    {
      char v18 = [v9 isEligible];

      if (v18)
      {
        uint64_t v19 = [v9 financingOptions];
        uint64_t v20 = [v19 count];

        if (v20 == 1)
        {
          id v21 = [v9 financingOptions];
          uint64_t v22 = [v21 firstObject];
          uint64_t v23 = *(void *)(a1 + 32);
          v24 = *(void **)(v23 + 152);
          *(void *)(v23 + 152) = v22;
        }
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 72);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke_73;
        v30[3] = &unk_1E59CD320;
        id v31 = *(id *)(a1 + 40);
        [v6 nextViewControllerFromState:5 parentViewController:v25 completion:v30];
        v26 = v31;
LABEL_26:

LABEL_6:
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v27 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      [v6[1] featureProduct];
      v28 = PKFeatureProductToString();
      *(_DWORD *)buf = 138412290;
      id v33 = v28;
      _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Error: updating the financing options. The selected product %@ is not eligible anymore.", buf, 0xCu);
    }
    uint64_t v29 = *(void *)(a1 + 40);
    v26 = [v6 _genericError];
    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v26);
    goto LABEL_26;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = PKFeatureApplicationStateToString();
    *(_DWORD *)buf = 138412290;
    id v33 = v13;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Application ended in state: %@. Completing pay later application flow", buf, 0xCu);
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void, void))(v14 + 16))(v14, 0, 0);
  }
LABEL_16:
}

uint64_t __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PKPayLaterSetupFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPayLaterSetupFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPayLaterFinancingController)financingController
{
  return self->_financingController;
}

- (int64_t)setupContext
{
  return self->_setupContext;
}

- (int64_t)controllerContext
{
  return self->_controllerContext;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (PKPaymentSetupViewControllerDelegate)setupViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupViewControllerDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupViewControllerDelegate:(id)a3
{
}

- (PKPayLaterFinancingOption)selectedFinancingOption
{
  return self->_selectedFinancingOption;
}

- (void)setSelectedFinancingOption:(id)a3
{
}

- (PKPayLaterPreliminaryAssessment)selectedPreliminaryAssessment
{
  return self->_selectedPreliminaryAssessment;
}

- (void)setSelectedPreliminaryAssessment:(id)a3
{
  self->_selectedPreliminaryAssessment = (PKPayLaterPreliminaryAssessment *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_destroyWeak((id *)&self->_setupViewControllerDelegate);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_financingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_nextViewControllerCompletion, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_securityCapabiltiesController, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_accountFlowController, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_localizedBundle, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);

  objc_storeStrong((id *)&self->_applyController, 0);
}

@end