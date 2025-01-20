@interface SKUIDonationAmountViewController
- (SKUIDonationAmountViewController)initWithCharity:(id)a3 configuration:(id)a4;
- (void)_amountChangedNotification:(id)a3;
- (void)_cancelButtonAction:(id)a3;
- (void)_donateButtonAction:(id)a3;
- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4;
- (void)_finishValidationWithResponse:(id)a3 error:(id)a4;
- (void)_performActionAfterValidation;
- (void)_reenableAfterFailure;
- (void)_setDonationButtonEnabled:(BOOL)a3;
- (void)_validateDonation:(id)a3;
- (void)dealloc;
- (void)donationConfigurationController:(id)a3 didLoadLogoForCharity:(id)a4;
- (void)loadView;
@end

@implementation SKUIDonationAmountViewController

- (SKUIDonationAmountViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationAmountViewController initWithCharity:configuration:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIDonationAmountViewController;
  v8 = [(SKUIDonationStepViewController *)&v13 initWithCharity:v6 configuration:v7];
  if (v8)
  {
    [v7 addObserver:v8];
    v9 = [v7 clientContext];
    v10 = v9;
    if (v9) {
      [v9 localizedStringForKey:@"DONATION_FLOW_TITLE"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_TITLE" inBundles:0];
    }
    [(SKUIDonationAmountViewController *)v8 setTitle:v11];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1F1C9B128 object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIDonationAmountViewController;
  [(SKUIDonationAmountViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [(SKUIDonationStepViewController *)self donationConfiguration];
  id v19 = [v3 clientContext];

  objc_super v4 = [(SKUIDonationAmountViewController *)self navigationItem];
  [v4 setHidesBackButton:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  [v5 setAction:sel__cancelButtonAction_];
  [v5 setTarget:self];
  if (v19) {
    [v19 localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON"];
  }
  else {
  id v6 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON" inBundles:0];
  }
  [v5 setTitle:v6];

  [v4 setLeftBarButtonItem:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  [v7 setAction:sel__donateButtonAction_];
  [v7 setEnabled:0];
  [v7 setTarget:self];
  if (v19) {
    [v19 localizedStringForKey:@"DONATION_FLOW_DONATE_BUTTON"];
  }
  else {
  v8 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_DONATE_BUTTON" inBundles:0];
  }
  [v7 setTitle:v8];

  [v4 setRightBarButtonItem:v7];
  amountView = self->_amountView;
  if (!amountView)
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = [SKUIDonationAmountView alloc];
    v12 = [(SKUIDonationStepViewController *)self charity];
    objc_super v13 = [(SKUIDonationAmountView *)v11 initWithCharity:v12];
    v14 = self->_amountView;
    self->_amountView = v13;

    v15 = self->_amountView;
    v16 = [(SKUIDonationStepViewController *)self donationConfiguration];
    v17 = [(SKUIDonationStepViewController *)self charity];
    v18 = [v16 logoImageForCharity:v17];
    [(SKUIDonationAmountView *)v15 setLogoImage:v18];

    [v10 addObserver:self selector:sel__amountChangedNotification_ name:0x1F1C9B128 object:self->_amountView];
    amountView = self->_amountView;
  }
  [(SKUIDonationAmountViewController *)self setView:amountView];
}

- (void)donationConfigurationController:(id)a3 didLoadLogoForCharity:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SKUIDonationStepViewController *)self charity];

  if (v7 == v6)
  {
    amountView = self->_amountView;
    v9 = [v10 logoImageForCharity:v6];
    [(SKUIDonationAmountView *)amountView setLogoImage:v9];
  }
}

- (void)_cancelButtonAction:(id)a3
{
  objc_super v4 = [(SKUIDonationStepViewController *)self donationViewController];
  id v5 = v4;
  if (!v4) {
    objc_super v4 = self;
  }
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_donateButtonAction:(id)a3
{
  amountView = self->_amountView;
  id v5 = a3;
  [(SKUIDonationAmountView *)amountView setUserInteractionEnabled:0];
  [v5 setEnabled:0];

  if ([(SKUIGiftValidator *)self->_validator isValidating])
  {
    self->_tappedNextWhileValidating = 1;
  }
  else if (self->_lastValidationResponse)
  {
    [(SKUIDonationAmountViewController *)self _performActionAfterValidation];
  }
  else
  {
    self->_tappedNextWhileValidating = 1;
    id v6 = [(SKUIDonationAmountView *)self->_amountView selectedAmount];
    [(SKUIDonationAmountViewController *)self _validateDonation:v6];
  }
}

- (void)_amountChangedNotification:(id)a3
{
  id v4 = [(SKUIDonationAmountView *)self->_amountView selectedAmount];
  if (v4)
  {
    [(SKUIDonationAmountViewController *)self _setDonationButtonEnabled:1];
    [(SKUIDonationAmountViewController *)self _validateDonation:v4];
  }
  else
  {
    [(SKUIDonationAmountViewController *)self _setDonationButtonEnabled:0];
    [(SKUIGiftValidator *)self->_validator cancelValidation];
  }
}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v23 = v6;
  if (v4)
  {
    id v7 = [SKUIDonationResultViewController alloc];
    v8 = [(SKUIDonationStepViewController *)self charity];
    v9 = [(SKUIDonationStepViewController *)self donationConfiguration];
    id v10 = [(SKUIDonationResultViewController *)v7 initWithCharity:v8 configuration:v9];

    v11 = [(SKUIDonationAmountView *)self->_amountView selectedAmount];
    [(SKUIDonationResultViewController *)v10 setDonationAmount:v11];

    v12 = [(SKUIDonationStepViewController *)self operationQueue];
    [(SKUIDonationStepViewController *)v10 setOperationQueue:v12];

    objc_super v13 = [(SKUIDonationAmountViewController *)self navigationController];
    [v13 pushViewController:v10 animated:1];
  }
  else
  {
    if (v6)
    {
      v14 = [(SKUIDonationStepViewController *)self donationConfiguration];
      v15 = [v14 clientContext];

      v16 = (void *)MEMORY[0x1E4FB1418];
      if (v15) {
        [v15 localizedStringForKey:@"DONATION_FLOW_UNABLE_TO_DONATE"];
      }
      else {
      v17 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_UNABLE_TO_DONATE" inBundles:0];
      }
      v18 = [v16 alertControllerWithTitle:v17 message:v23 preferredStyle:1];

      id v19 = (void *)MEMORY[0x1E4FB1410];
      if (v15) {
        [v15 localizedStringForKey:@"DONATION_FLOW_OK_BUTTON"];
      }
      else {
      v20 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_OK_BUTTON" inBundles:0];
      }
      v21 = [v19 actionWithTitle:v20 style:0 handler:0];
      [v18 addAction:v21];

      [(SKUIDonationAmountViewController *)self presentViewController:v18 animated:1 completion:0];
    }
    [(SKUIDonationAmountViewController *)self _reenableAfterFailure];
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;
}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_lastValidationResponse, a3);
  id v6 = [(SKUIDonationAmountView *)self->_amountView selectedAmount];
  [(SKUIDonationAmountViewController *)self _setDonationButtonEnabled:v6 != 0];

  if (self->_tappedNextWhileValidating)
  {
    self->_tappedNextWhileValidating = 0;
    [(SKUIDonationAmountViewController *)self _performActionAfterValidation];
  }
}

- (void)_performActionAfterValidation
{
  if ([(SKUIGiftValidationResponse *)self->_lastValidationResponse isValid])
  {
    if (!self->_purchaseRequest)
    {
      objc_initWeak(&location, self);
      v3 = [SKUIGiftPurchaseRequest alloc];
      BOOL v4 = [(SKUIDonationAmountView *)self->_amountView selectedAmount];
      id v5 = [(SKUIDonationStepViewController *)self donationConfiguration];
      id v6 = [(SKUIGiftPurchaseRequest *)v3 initWithDonation:v4 configuration:v5];
      purchaseRequest = self->_purchaseRequest;
      self->_purchaseRequest = v6;

      v8 = self->_purchaseRequest;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke;
      v18[3] = &unk_1E6425088;
      objc_copyWeak(&v19, &location);
      [(SKUIGiftPurchaseRequest *)v8 purchaseWithCompletionBlock:v18];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v9 = [(SKUIDonationStepViewController *)self donationConfiguration];
    id v17 = [v9 clientContext];

    id v10 = (void *)MEMORY[0x1E4FB1418];
    if (v17) {
      [v17 localizedStringForKey:@"DONATION_FLOW_INVALID_DONATION"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_INVALID_DONATION" inBundles:0];
    }
    v12 = [(SKUIGiftValidationResponse *)self->_lastValidationResponse errorString];
    objc_super v13 = [v10 alertControllerWithTitle:v11 message:v12 preferredStyle:1];

    v14 = (void *)MEMORY[0x1E4FB1410];
    if (v17) {
      [v17 localizedStringForKey:@"DONATION_FLOW_OK_BUTTON"];
    }
    else {
    v15 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_OK_BUTTON" inBundles:0];
    }
    v16 = [v14 actionWithTitle:v15 style:0 handler:0];
    [v13 addAction:v16];

    [(SKUIDonationAmountViewController *)self presentViewController:v13 animated:1 completion:0];
    [(SKUIDonationAmountViewController *)self _reenableAfterFailure];
  }
}

void __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke_2;
  block[3] = &unk_1E6424248;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __65__SKUIDonationAmountViewController__performActionAfterValidation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishPurchaseWithResult:*(unsigned __int8 *)(a1 + 48) errorMessage:*(void *)(a1 + 32)];
}

- (void)_reenableAfterFailure
{
  [(SKUIDonationAmountView *)self->_amountView setUserInteractionEnabled:1];
  id v3 = [(SKUIDonationAmountView *)self->_amountView selectedAmount];
  [(SKUIDonationAmountViewController *)self _setDonationButtonEnabled:v3 != 0];
}

- (void)_setDonationButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(SKUIDonationAmountViewController *)self navigationItem];
  id v6 = [v4 rightBarButtonItem];

  if (v3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [v6 setEnabled:v3];
  [v6 setStyle:v5];
}

- (void)_validateDonation:(id)a3
{
  id v4 = a3;
  validator = self->_validator;
  if (validator)
  {
    [(SKUIGiftValidator *)validator cancelValidation];
  }
  else
  {
    id v6 = [(SKUIDonationStepViewController *)self donationConfiguration];
    id v7 = [SKUIGiftValidator alloc];
    id v8 = [v6 donationValidationURL];
    id v9 = [v6 clientContext];
    char v10 = [(SKUIGiftValidator *)v7 initWithValidationURL:v8 clientContext:v9];
    v11 = self->_validator;
    self->_validator = v10;

    v12 = self->_validator;
    objc_super v13 = [(SKUIDonationStepViewController *)self operationQueue];
    [(SKUIGiftValidator *)v12 setOperationQueue:v13];
  }
  objc_initWeak(&location, self);
  v14 = self->_validator;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__SKUIDonationAmountViewController__validateDonation___block_invoke;
  v15[3] = &unk_1E64242E8;
  objc_copyWeak(&v16, &location);
  [(SKUIGiftValidator *)v14 validateDonation:v4 withCompletionBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __54__SKUIDonationAmountViewController__validateDonation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SKUIDonationAmountViewController__validateDonation___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __54__SKUIDonationAmountViewController__validateDonation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishValidationWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
  objc_storeStrong((id *)&self->_lastValidationResponse, 0);

  objc_storeStrong((id *)&self->_amountView, 0);
}

- (void)initWithCharity:configuration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDonationAmountViewController initWithCharity:configuration:]";
}

@end