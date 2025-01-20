@interface PKPayLaterEnterAmountSetupViewController
- (BOOL)shouldAllowDecimalInput;
- (PKPayLaterEnterAmountSetupViewController)initWithSetupFlowController:(id)a3;
- (id)headerSubtitle;
- (id)headerTitle;
- (void)_cancelButtonTapped;
- (void)currencyAmountUpdated:(id)a3;
- (void)nextButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKPayLaterEnterAmountSetupViewController

- (PKPayLaterEnterAmountSetupViewController)initWithSetupFlowController:(id)a3
{
  id v5 = a3;
  v6 = [v5 financingController];
  v7 = [v6 payLaterAccount];

  v37.receiver = self;
  v37.super_class = (Class)PKPayLaterEnterAmountSetupViewController;
  v8 = [(PKPayLaterEnterAmountViewController *)&v37 initWithPayLaterAccount:v7];
  v9 = v8;
  if (v8)
  {
    [(PKPayLaterEnterAmountSetupViewController *)v8 setModalInPresentation:1];
    objc_storeStrong((id *)&v9->_setupController, a3);
    uint64_t v10 = PKPayLaterDynamicContentPageTypeToString();
    pageTag = v9->_pageTag;
    v9->_pageTag = (NSString *)v10;

    v12 = [v5 financingController];
    v13 = [v12 dynamicContent];
    uint64_t v14 = [v5 selectedProductType];
    v15 = [v5 selectedFinancingOption];
    v16 = [v15 identifier];
    uint64_t v17 = [v13 dynamicContentPageForPageType:10 productType:v14 optionIdentifier:v16];
    dynamicContentPage = v9->_dynamicContentPage;
    v9->_dynamicContentPage = (PKPayLaterDynamicContentPage *)v17;

    v19 = [v7 payLaterDetails];
    v20 = [(PKPayLaterDynamicContentPage *)v9->_dynamicContentPage minimumAmount];
    v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v22 = [v19 minimumSinglePurchaseAmount];
    }
    v23 = v22;

    v24 = [(PKPayLaterDynamicContentPage *)v9->_dynamicContentPage maximumAmount];
    v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      id v26 = [v19 maximumSinglePurchaseAmount];
    }
    v27 = v26;

    v28 = [v23 amount];
    [(PKPayLaterEnterAmountViewController *)v9 setMinAllowedAmount:v28];

    v29 = [v27 amount];
    [(PKPayLaterEnterAmountViewController *)v9 setMaxAllowedAmount:v29];

    if (v23)
    {
      v30 = [v23 minimalFormattedStringValue];
      uint64_t v31 = PKLocalizedCocoonString(&cfstr_EnterAmountMin.isa, &stru_1EF1B4C70.isa, v30);
      minimumString = v9->_minimumString;
      v9->_minimumString = (NSString *)v31;
    }
    if (v27)
    {
      v33 = [v27 minimalFormattedStringValue];
      uint64_t v34 = PKLocalizedCocoonString(&cfstr_EnterAmountMax.isa, &stru_1EF1B4C70.isa, v33);
      maximumString = v9->_maximumString;
      v9->_maximumString = (NSString *)v34;
    }
  }

  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterEnterAmountSetupViewController;
  [(PKPayLaterEnterAmountViewController *)&v9 viewDidAppear:a3];
  v4 = [(PKPayLaterEnterAmountSetupViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 menu:0];
    [v7 setTarget:self];
    [v7 setAction:sel__cancelButtonTapped];
    v8 = [(PKPayLaterEnterAmountSetupViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:v7];
  }
}

- (id)headerTitle
{
  v2 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage headerTitle];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    PKLocalizedCocoonString(&cfstr_HowMuchIsPurch.isa);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

- (id)headerSubtitle
{
  v2 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage headerSubtitle];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    PKLocalizedCocoonString(&cfstr_HowMuchIsPurch_0.isa);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

- (void)currencyAmountUpdated:(id)a3
{
  id v4 = a3;
  id v10 = [v4 amount];
  id v5 = [v4 currency];

  if (v10 && v5)
  {
    uint64_t v6 = [(PKPayLaterEnterAmountViewController *)self minAllowedAmount];
    v7 = [(PKPayLaterEnterAmountViewController *)self maxAllowedAmount];
    if (v6 && [v10 compare:v6] == -1)
    {
      v8 = &OBJC_IVAR___PKPayLaterEnterAmountSetupViewController__minimumString;
    }
    else
    {
      if (!v7 || [v10 compare:v7] != 1)
      {
        id v9 = 0;
LABEL_11:
        [(PKPayLaterEnterAmountViewController *)self setAmountDetailsText:v9];

        goto LABEL_12;
      }
      v8 = &OBJC_IVAR___PKPayLaterEnterAmountSetupViewController__maximumString;
    }
    id v9 = *(id *)((char *)&self->super.super.super.super.isa + *v8);
    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)shouldAllowDecimalInput
{
  return 0;
}

- (void)nextButtonTapped
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPayLaterEnterAmountViewController *)self currencyAmount];
  id v4 = [v3 amount];

  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Updating pay later amount to %@", buf, 0xCu);
  }

  [(PKPayLaterEnterAmountViewController *)self showNavigationBarSpinner:1];
  uint64_t v6 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  v7 = [v6 configuration];
  [v7 updateTransactionAmount:v4];

  objc_initWeak((id *)buf, self);
  setupController = self->_setupController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke;
  v9[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v10, (id *)buf);
  [(PKPayLaterSetupFlowController *)setupController nextViewControllerFromState:3 parentViewController:self completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_2;
    aBlock[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v16, v7);
    id v9 = _Block_copy(aBlock);
    if (v5)
    {
      id v10 = [WeakRetained navigationController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_3;
      v13[3] = &unk_1E59CA9F8;
      id v14 = v9;
      objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v13);

      id v11 = v14;
    }
    else
    {
      if (!v6)
      {
        [WeakRetained _cancelButtonTapped];
        goto LABEL_7;
      }
      v12 = PKAccountDisplayableError();
      id v11 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);

      [WeakRetained presentViewController:v11 animated:1 completion:v9];
    }

LABEL_7:
    objc_destroyWeak(&v16);
  }
}

void __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showNavigationBarSpinner:0];
    id WeakRetained = v2;
  }
}

uint64_t __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cancelButtonTapped
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTag, 0);
  objc_storeStrong((id *)&self->_maximumString, 0);
  objc_storeStrong((id *)&self->_minimumString, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);

  objc_storeStrong((id *)&self->_setupController, 0);
}

@end