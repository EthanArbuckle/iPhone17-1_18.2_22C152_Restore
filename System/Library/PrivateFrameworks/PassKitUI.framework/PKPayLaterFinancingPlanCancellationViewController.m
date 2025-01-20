@interface PKPayLaterFinancingPlanCancellationViewController
+ (void)planCancellationReasonsDynamincContentForPayLaterAccount:(id)a3 financingPlan:(id)a4 completion:(id)a5;
- (PKPayLaterFinancingPlanCancellationViewController)initWithPayLaterAccount:(id)a3 financingPlan:(id)a4 dynamicContentPage:(id)a5;
- (void)_cancelButtonTapped;
- (void)_preflightIfNecessary;
- (void)_submitButtonTapped;
- (void)_updateRightBarButtonEnabledState;
- (void)_updateView;
- (void)didSelectCancellationRow:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterFinancingPlanCancellationViewController

- (PKPayLaterFinancingPlanCancellationViewController)initWithPayLaterAccount:(id)a3 financingPlan:(id)a4 dynamicContentPage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F84968]);
    v12 = PKLocalizedCocoonString(&cfstr_LoadingCancell.isa);
    [v11 setHeaderTitle:v12];
  }
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlanCancellationViewController;
  v13 = [(PKPayLaterViewController *)&v16 initWithPayLaterAccount:v8];
  v14 = v13;
  if (v13)
  {
    v13->_shouldLoadCancellationReasons = v10 == 0;
    objc_storeStrong((id *)&v13->_financingPlan, a4);
    objc_storeStrong((id *)&v14->_dynamicContentPage, v11);
    [(PKDynamicCollectionViewController *)v14 setUseItemIdentityWhenUpdating:1];
    [(PKPayLaterFinancingPlanCancellationViewController *)v14 _preflightIfNecessary];
  }

  return v14;
}

- (void)_preflightIfNecessary
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v15, &location);
  v3 = (void (**)(void))_Block_copy(aBlock);
  BOOL shouldLoadCancellationReasons = self->_shouldLoadCancellationReasons;
  v5 = PKLogFacilityTypeGetObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (shouldLoadCancellationReasons)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Loading loan cancellation reasons.", buf, 2u);
    }

    v7 = objc_opt_class();
    id v8 = [(PKPayLaterViewController *)self payLaterAccount];
    financingPlan = self->_financingPlan;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_16;
    v10[3] = &unk_1E59CF9F0;
    objc_copyWeak(&v12, &location);
    id v11 = v3;
    [v7 planCancellationReasonsDynamincContentForPayLaterAccount:v8 financingPlan:financingPlan completion:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Loan cancellation reasons already loaded.", buf, 2u);
    }

    v3[2](v3);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PKPayLaterFinancingPlanCancellationSectionController alloc];
    uint64_t v3 = *((void *)WeakRetained + 166);
    v4 = [WeakRetained payLaterAccount];
    uint64_t v5 = [(PKPayLaterFinancingPlanCancellationSectionController *)v2 initWithFinancingPlan:v3 payLaterAccount:v4 dynamicContentPage:*((void *)WeakRetained + 167) viewControllerDelegate:WeakRetained];
    BOOL v6 = (void *)*((void *)WeakRetained + 168);
    *((void *)WeakRetained + 168) = v5;

    [*((id *)WeakRetained + 168) setDynamicCollectionDelegate:WeakRetained];
    v8[0] = *((void *)WeakRetained + 168);
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [WeakRetained setSections:v7 animated:1];

    [WeakRetained _updateView];
  }
}

void __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1368) = 0;
    if (!v6 || v7)
    {
      id v10 = PKAccountDisplayableError();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_2;
      v12[3] = &unk_1E59CA7D0;
      v12[4] = v9;
      id v11 = PKAlertForDisplayableErrorWithHandlers(v10, 0, v12, 0);

      if (v11) {
        [v9 presentViewController:v11 animated:1 completion:0];
      }
    }
    else
    {
      objc_storeStrong(WeakRetained + 167, a2);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __74__PKPayLaterFinancingPlanCancellationViewController__preflightIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)didSelectCancellationRow:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 identifier];
      id v8 = [v5 contentTitle];
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Updated loan cancellation reason to identifier %@, description %@", (uint8_t *)&v9, 0x16u);
    }
    objc_storeStrong((id *)&self->_selectedReason, a3);
    [(PKPayLaterFinancingPlanCancellationViewController *)self _updateRightBarButtonEnabledState];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingPlanCancellationViewController;
  [(PKPayLaterViewController *)&v3 viewDidLoad];
  [(PKPayLaterFinancingPlanCancellationViewController *)self _updateView];
}

- (void)_submitButtonTapped
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F84270] sharedInstance];
  v4 = [(PKPayLaterViewController *)self payLaterAccount];
  id v5 = [v4 accountIdentifier];

  id v6 = [(PKPayLaterDynamicContentPageItem *)self->_selectedReason identifier];
  id v7 = [(PKPayLaterDynamicContentPageItem *)self->_selectedReason contentTitle];
  id v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  int v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Submitting loan cancellation for plan %@ with reason %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke;
  v13[3] = &unk_1E59CFA40;
  objc_copyWeak(&v17, (id *)buf);
  id v10 = v3;
  id v14 = v10;
  id v11 = v5;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  [v10 cancelFinancingPlanWithIdentifier:v12 accountIdentifier:v11 cancellationReasonIdentifier:v6 cancellationReasonDescription:v7 completion:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_2;
  block[3] = &unk_1E59CB838;
  objc_copyWeak(&v10, a1 + 7);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = PKAccountDisplayableError();
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_3;
      v11[3] = &unk_1E59CA7D0;
      v11[4] = WeakRetained;
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v11, 0);

      if (v5) {
        [WeakRetained presentViewController:v5 animated:1 completion:0];
      }
      [WeakRetained setShowNavigationBarSpinner:0];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_4;
      v8[3] = &unk_1E59CDFB0;
      objc_copyWeak(&v10, v2);
      id v9 = *(id *)(a1 + 56);
      [v6 updateFinancingPlansForAccountWithIdentifier:v7 pageOffset:0 limit:0 ignoreLastUpdatedDate:0 forceFetch:0 completion:v8];

      objc_destroyWeak(&v10);
    }
  }
}

uint64_t __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_5;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_6;
    v5[3] = &unk_1E59CFA18;
    id v3 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    id v4 = objc_msgSend(v3, "pk_firstObjectPassingTest:", v5);
    if (v4)
    {
      objc_storeStrong(WeakRetained + 166, v4);
      [WeakRetained[168] setFinancingPlan:v4];
    }
    [WeakRetained setShowNavigationBarSpinner:0];
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

uint64_t __72__PKPayLaterFinancingPlanCancellationViewController__submitButtonTapped__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 planIdentifier];
  id v4 = *(void **)(a1 + 32);
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

- (void)_cancelButtonTapped
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Cancel tapped on PKPayLaterFinancingPlanCancellationViewController", v4, 2u);
  }

  [(PKPayLaterFinancingPlanCancellationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_updateRightBarButtonEnabledState
{
  [(UIBarButtonItem *)self->_rightbarButton setEnabled:self->_selectedReason != 0];
}

- (void)_updateView
{
  id v3 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  id v4 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage headerSubtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v4];

  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:self->_shouldLoadCancellationReasons];
  id v5 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage primaryActionTitle];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    PKLocalizedCocoonString(&cfstr_SubmitButton.isa);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v17 = v7;

  uint64_t v8 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v17 menu:0];
  rightbarButton = self->_rightbarButton;
  self->_rightbarButton = v8;

  [(UIBarButtonItem *)self->_rightbarButton setStyle:2];
  [(UIBarButtonItem *)self->_rightbarButton setTarget:self];
  [(UIBarButtonItem *)self->_rightbarButton setAction:sel__submitButtonTapped];
  id v10 = [(PKPayLaterFinancingPlanCancellationViewController *)self navigationItem];
  [v10 setRightBarButtonItem:self->_rightbarButton];

  id v11 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage secondaryActionTitle];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    PKLocalizedString(&cfstr_Cancel.isa);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v13;

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v14 menu:0];
  [v15 setTarget:self];
  [v15 setAction:sel__cancelButtonTapped];
  id v16 = [(PKPayLaterFinancingPlanCancellationViewController *)self navigationItem];
  [v16 setLeftBarButtonItem:v15];

  [(PKPayLaterFinancingPlanCancellationViewController *)self _updateRightBarButtonEnabledState];
}

+ (void)planCancellationReasonsDynamincContentForPayLaterAccount:(id)a3 financingPlan:(id)a4 completion:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    id v7 = (objc_class *)MEMORY[0x1E4F84340];
    id v8 = a3;
    id v9 = objc_alloc_init(v7);
    id v10 = [v8 accountIdentifier];
    [v9 setAccountIdentifier:v10];

    id v11 = [v8 accountBaseURL];

    [v9 setBaseURL:v11];
    [v9 setType:15];
    id v12 = [MEMORY[0x1E4F84D50] sharedService];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke;
    v13[3] = &unk_1E59CFA68;
    id v14 = v6;
    [v12 accountPayLaterContentWithRequest:v9 completion:v13];
  }
}

void __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke_2;
  block[3] = &unk_1E59CA938;
  id v11 = v5;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __135__PKPayLaterFinancingPlanCancellationViewController_planCancellationReasonsDynamincContentForPayLaterAccount_financingPlan_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dynamicContent];
  id v3 = [v2 dynamicContentPageForPageType:17];
  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "There is no dynamic content page for PKPayLaterDynamicContentPageTypeFinancingPlanCancellationReasons", v6, 2u);
    }

    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v4();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedReason, 0);
  objc_storeStrong((id *)&self->_rightbarButton, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end