@interface PKPayLaterChangeFundingSourceViewController
- (BOOL)_canChangeFundingSource;
- (PKPayLaterChangeFundingSourceViewController)initWithFinancingPlan:(id)a3 payLaterPass:(id)a4 paymentIntentController:(id)a5;
- (void)_presentChangeFundingSourceFlowWithPrimaryPaymentSource:(id)a3 completion:(id)a4;
- (void)_presentUnableToChangeFundingSourceAlert;
- (void)_turnOffAutoPaymentWithCompletion:(id)a3;
- (void)_updateSectionControllerAnimated:(BOOL)a3;
- (void)didSelectFundingSource:(id)a3;
- (void)didUpdateAutoPayment:(BOOL)a3 completion:(id)a4;
- (void)didUpdateFinancingPlan:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterChangeFundingSourceViewController

- (PKPayLaterChangeFundingSourceViewController)initWithFinancingPlan:(id)a3 payLaterPass:(id)a4 paymentIntentController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 payLaterAccount];
  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterChangeFundingSourceViewController;
  v13 = [(PKPayLaterViewController *)&v19 initWithPayLaterAccount:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_financingPlan, a3);
    objc_storeStrong((id *)&v13->_payLaterPass, a4);
    objc_storeStrong((id *)&v13->_paymentIntentController, a5);
    uint64_t v14 = [v9 paymentSource];
    selectedPaymentSource = v13->_selectedPaymentSource;
    v13->_selectedPaymentSource = (PKPayLaterPaymentSource *)v14;

    [(PKDynamicCollectionViewController *)v13 setUseItemIdentityWhenUpdating:1];
    v16 = [(PKPayLaterChangeFundingSourceViewController *)v13 navigationItem];
    v17 = PKLocalizedCocoonString(&cfstr_AutoPay.isa);
    [v16 setTitle:v17];
  }
  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    paymentIntentController = self->_paymentIntentController;
    financingPlan = self->_financingPlan;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E59D0040;
    v8[4] = self;
    id v9 = v4;
    [(PKPayLaterPaymentIntentController *)paymentIntentController intentDetailsForFinancingPlan:financingPlan intent:2 completion:v8];
  }
}

void __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke_2;
  v10[3] = &unk_1E59CB728;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __71__PKPayLaterChangeFundingSourceViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1360), *(id *)(a1 + 40));
  v2 = -[PKPayLaterChangeFundingSourceSectionController initWithFinancingPlan:payLaterPass:paymentIntentController:intentDetails:dynamicContentPage:delegate:]([PKPayLaterChangeFundingSourceSectionController alloc], "initWithFinancingPlan:payLaterPass:paymentIntentController:intentDetails:dynamicContentPage:delegate:", *(void *)(*(void *)(a1 + 32) + 1328), *(void *)(*(void *)(a1 + 32) + 1336), *(void *)(*(void *)(a1 + 32) + 1344), *(void *)(*(void *)(a1 + 32) + 1360), 0);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1352);
  *(void *)(v3 + 1352) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1352), "setDynamicCollectionDelegate:");
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v5();
}

- (void)didSelectFundingSource:(id)a3
{
  id v4 = a3;
  if ([(PKPayLaterChangeFundingSourceViewController *)self _canChangeFundingSource]) {
    [(PKPayLaterChangeFundingSourceViewController *)self _presentChangeFundingSourceFlowWithPrimaryPaymentSource:v4 completion:0];
  }
  else {
    [(PKPayLaterChangeFundingSourceViewController *)self _presentUnableToChangeFundingSourceAlert];
  }
}

- (void)didUpdateAutoPayment:(BOOL)a3 completion:(id)a4
{
  if (a3) {
    [(PKPayLaterChangeFundingSourceViewController *)self _presentChangeFundingSourceFlowWithPrimaryPaymentSource:self->_selectedPaymentSource completion:a4];
  }
  else {
    [(PKPayLaterChangeFundingSourceViewController *)self _turnOffAutoPaymentWithCompletion:a4];
  }
}

- (BOOL)_canChangeFundingSource
{
  return [(PKPayLaterFinancingPlan *)self->_financingPlan state] != 3;
}

- (void)_presentUnableToChangeFundingSourceAlert
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presenting pending confirmed alert for trying to change funding source.", v11, 2u);
  }

  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = PKLocalizedCocoonString(&cfstr_PlanConfirmedF.isa);
  id v6 = PKLocalizedCocoonString(&cfstr_PlanConfirmedF_0.isa);
  v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  id v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = PKLocalizedCocoonString(&cfstr_PlanConfirmedF_1.isa);
  id v10 = [v8 actionWithTitle:v9 style:0 handler:0];

  [v7 addAction:v10];
  [(PKPayLaterChangeFundingSourceViewController *)self presentViewController:v7 animated:1 completion:0];
  [(PKPayLaterChangeFundingSourceViewController *)self _updateSectionControllerAnimated:1];
}

- (void)_presentChangeFundingSourceFlowWithPrimaryPaymentSource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v9 = [(PKPayLaterChangeFundingSourceViewController *)self view];
  id v10 = [v9 window];
  id v11 = [v10 windowScene];
  id v12 = [v11 _sceneIdentifier];

  paymentIntentController = self->_paymentIntentController;
  financingPlan = self->_financingPlan;
  intentDetails = self->_intentDetails;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke;
  v18[3] = &unk_1E59D0090;
  objc_copyWeak(&v22, &location);
  id v16 = v7;
  id v21 = v16;
  id v17 = v8;
  id v19 = v17;
  v20 = self;
  [(PKPayLaterPaymentIntentController *)paymentIntentController presentPaymentAuthorizationForFinancingPlan:financingPlan primaryPaymentSource:v6 intentDetails:intentDetails intent:2 currencyAmount:0 presentationSceneIdentifier:v12 completion:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke(uint64_t a1, int a2, char a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9) {
        (*(void (**)(void))(v9 + 16))();
      }
      [WeakRetained _updateSectionControllerAnimated:1];
    }
    else if (v7 || (a3 & 1) == 0)
    {
      id v17 = PKAccountDisplayableError();
      id v18 = PKAlertForDisplayableErrorWithHandlers(v17, 0, 0, 0);

      [WeakRetained presentViewController:v18 animated:1 completion:0];
      id v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v7;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Failed to present change funding source flow payment intent authorization %@", buf, 0xCu);
      }

      uint64_t v20 = *(void *)(a1 + 48);
      if (v20) {
        (*(void (**)(void))(v20 + 16))();
      }
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *(void **)(a1 + 32);
        id v12 = PKFinancingPlanPaymentIntentTypeToString();
        *(_DWORD *)buf = 138412546;
        id v24 = v11;
        __int16 v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Completed presenting change funding source flow for planIdentifier %@, intent %@", buf, 0x16u);
      }
      id v13 = [WeakRetained accountService];
      uint64_t v14 = [WeakRetained payLaterAccount];
      v15 = [v14 accountIdentifier];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_26;
      v21[3] = &unk_1E59D0068;
      id v16 = *(void **)(a1 + 48);
      v21[4] = *(void *)(a1 + 40);
      id v22 = v16;
      [v13 updateFinancingPlansForAccountWithIdentifier:v15 pageOffset:0 limit:0 ignoreLastUpdatedDate:0 forceFetch:0 completion:v21];
    }
  }
}

void __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_3;
  v5[3] = &unk_1E59CFA18;
  v5[4] = *(void *)(a1 + 40);
  id v3 = objc_msgSend(v2, "pk_firstObjectPassingTest:", v5);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1328), v3);
    [*(id *)(a1 + 40) _updateSectionControllerAnimated:1];
  }
}

uint64_t __114__PKPayLaterChangeFundingSourceViewController__presentChangeFundingSourceFlowWithPrimaryPaymentSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 planIdentifier];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1328) planIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterChangeFundingSourceViewController;
  [(PKPayLaterViewController *)&v6 viewDidLoad];
  id v3 = [(PKPayLaterChangeFundingSourceViewController *)self navigationController];
  uint64_t v4 = PKLocalizedCocoonString(&cfstr_AutoPay.isa);
  [v3 setTitle:v4];

  if (self->_sectionController)
  {
    v7[0] = self->_sectionController;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:0];
  }
}

- (void)_updateSectionControllerAnimated:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Updating PKPayLaterChangeFundingSourceSectionController", v6, 2u);
  }

  [(PKPayLaterChangeFundingSourceSectionController *)self->_sectionController setFinancingPlan:self->_financingPlan];
  v7[0] = self->_sectionController;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:1];
}

- (void)_turnOffAutoPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPayLaterViewController *)self payLaterAccount];
  objc_super v6 = [v5 accountIdentifier];

  id v7 = objc_alloc_init(MEMORY[0x1E4F84328]);
  [v7 setAccountIdentifier:v6];
  uint64_t v8 = [(PKPayLaterViewController *)self payLaterAccount];
  uint64_t v9 = [v8 accountBaseURL];
  [v7 setBaseURL:v9];

  id v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  [v7 setPlanIdentifier:v10];

  [v7 setAutoPayment:0];
  id v11 = objc_alloc_init(MEMORY[0x1E4F84518]);
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke;
  v23[3] = &unk_1E59D0108;
  id v12 = v7;
  id v24 = v12;
  objc_copyWeak(&v25, &location);
  [v11 addOperation:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_4;
  v20[3] = &unk_1E59CD438;
  v20[4] = self;
  id v13 = v6;
  id v21 = v13;
  objc_copyWeak(&v22, &location);
  [v11 addOperation:v20];
  uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_39;
  v17[3] = &unk_1E59D0158;
  objc_copyWeak(&v19, &location);
  id v15 = v4;
  v17[4] = self;
  id v18 = v15;
  id v16 = (id)[v11 evaluateWithInput:v14 completion:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v11 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2;
  v14[3] = &unk_1E59D00E0;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v10 accountPayLaterChangeAutoPaymentWithRequest:v11 completion:v14];

  objc_destroyWeak(&v17);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_3;
  v6[3] = &unk_1E59D00B8;
  objc_copyWeak(&v10, a1 + 6);
  id v7 = v4;
  id v9 = a1[5];
  id v8 = a1[4];
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v10);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v3 = PKAccountDisplayableError();
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

      if (v4) {
        [v5 presentViewController:v4 animated:1 completion:0];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id WeakRetained = v5;
  }
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) accountService];
  uint64_t v11 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_5;
  v14[3] = &unk_1E59D0130;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v10 updateFinancingPlansForAccountWithIdentifier:v11 pageOffset:0 limit:0 ignoreLastUpdatedDate:0 forceFetch:1 completion:v14];

  objc_destroyWeak(&v17);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_6;
  v5[3] = &unk_1E59D00B8;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v8 = a1[5];
  id v7 = a1[4];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_7;
    v7[3] = &unk_1E59CFA18;
    v7[4] = WeakRetained;
    id v4 = objc_msgSend(v3, "pk_firstObjectPassingTest:", v7);
    if (v4)
    {
      [WeakRetained didUpdateFinancingPlan:v4];
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [WeakRetained[166] planIdentifier];
        *(_DWORD *)buf = 138412290;
        id v9 = v6;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "There is no financing plan with ID %@ updated after changing the auto payment method", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 planIdentifier];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1328) planIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_39(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2_40;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v2 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __81__PKPayLaterChangeFundingSourceViewController__turnOffAutoPaymentWithCompletion___block_invoke_2_40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _updateSectionControllerAnimated:1];
    id WeakRetained = v3;
  }
}

- (void)didUpdateFinancingPlan:(id)a3
{
  id v11 = a3;
  id v5 = [v11 planIdentifier];
  id v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  id v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_9;
  }
  char v10 = [v7 isEqualToString:v8];

  if (v10)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_financingPlan, a3);
    [(PKPayLaterChangeFundingSourceViewController *)self _updateSectionControllerAnimated:1];
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPaymentSource, 0);
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end