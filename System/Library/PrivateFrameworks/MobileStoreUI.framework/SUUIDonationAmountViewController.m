@interface SUUIDonationAmountViewController
- (SUUIDonationAmountViewController)initWithCharity:(id)a3 configuration:(id)a4;
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

@implementation SUUIDonationAmountViewController

- (SUUIDonationAmountViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDonationAmountViewController;
  v7 = [(SUUIDonationStepViewController *)&v12 initWithCharity:a3 configuration:v6];
  if (v7)
  {
    [v6 addObserver:v7];
    v8 = [v6 clientContext];
    v9 = v8;
    if (v8) {
      [v8 localizedStringForKey:@"DONATION_FLOW_TITLE"];
    }
    else {
    v10 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_TITLE" inBundles:0];
    }
    [(SUUIDonationAmountViewController *)v7 setTitle:v10];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:0x27050C730 object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIDonationAmountViewController;
  [(SUUIDonationAmountViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [(SUUIDonationStepViewController *)self donationConfiguration];
  id v19 = [v3 clientContext];

  objc_super v4 = [(SUUIDonationAmountViewController *)self navigationItem];
  [v4 setHidesBackButton:1];
  id v5 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v5 setAction:sel__cancelButtonAction_];
  [v5 setTarget:self];
  if (v19) {
    [v19 localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON"];
  }
  else {
  id v6 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON" inBundles:0];
  }
  [v5 setTitle:v6];

  [v4 setLeftBarButtonItem:v5];
  id v7 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v7 setAction:sel__donateButtonAction_];
  [v7 setEnabled:0];
  [v7 setTarget:self];
  if (v19) {
    [v19 localizedStringForKey:@"DONATION_FLOW_DONATE_BUTTON"];
  }
  else {
  v8 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_DONATE_BUTTON" inBundles:0];
  }
  [v7 setTitle:v8];

  [v4 setRightBarButtonItem:v7];
  amountView = self->_amountView;
  if (!amountView)
  {
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = [SUUIDonationAmountView alloc];
    objc_super v12 = [(SUUIDonationStepViewController *)self charity];
    v13 = [(SUUIDonationAmountView *)v11 initWithCharity:v12];
    v14 = self->_amountView;
    self->_amountView = v13;

    v15 = self->_amountView;
    v16 = [(SUUIDonationStepViewController *)self donationConfiguration];
    v17 = [(SUUIDonationStepViewController *)self charity];
    v18 = [v16 logoImageForCharity:v17];
    [(SUUIDonationAmountView *)v15 setLogoImage:v18];

    [v10 addObserver:self selector:sel__amountChangedNotification_ name:0x27050C730 object:self->_amountView];
    amountView = self->_amountView;
  }
  [(SUUIDonationAmountViewController *)self setView:amountView];
}

- (void)donationConfigurationController:(id)a3 didLoadLogoForCharity:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SUUIDonationStepViewController *)self charity];

  if (v7 == v6)
  {
    amountView = self->_amountView;
    v9 = [v10 logoImageForCharity:v6];
    [(SUUIDonationAmountView *)amountView setLogoImage:v9];
  }
}

- (void)_cancelButtonAction:(id)a3
{
  objc_super v4 = [(SUUIDonationStepViewController *)self donationViewController];
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
  [(SUUIDonationAmountView *)amountView setUserInteractionEnabled:0];
  [v5 setEnabled:0];

  if ([(SUUIGiftValidator *)self->_validator isValidating])
  {
    self->_tappedNextWhileValidating = 1;
  }
  else if (self->_lastValidationResponse)
  {
    [(SUUIDonationAmountViewController *)self _performActionAfterValidation];
  }
  else
  {
    self->_tappedNextWhileValidating = 1;
    id v6 = [(SUUIDonationAmountView *)self->_amountView selectedAmount];
    [(SUUIDonationAmountViewController *)self _validateDonation:v6];
  }
}

- (void)_amountChangedNotification:(id)a3
{
  id v4 = [(SUUIDonationAmountView *)self->_amountView selectedAmount];
  if (v4)
  {
    [(SUUIDonationAmountViewController *)self _setDonationButtonEnabled:1];
    [(SUUIDonationAmountViewController *)self _validateDonation:v4];
  }
  else
  {
    [(SUUIDonationAmountViewController *)self _setDonationButtonEnabled:0];
    [(SUUIGiftValidator *)self->_validator cancelValidation];
  }
}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v23 = v6;
  if (v4)
  {
    id v7 = [SUUIDonationResultViewController alloc];
    v8 = [(SUUIDonationStepViewController *)self charity];
    v9 = [(SUUIDonationStepViewController *)self donationConfiguration];
    id v10 = [(SUUIDonationResultViewController *)v7 initWithCharity:v8 configuration:v9];

    v11 = [(SUUIDonationAmountView *)self->_amountView selectedAmount];
    [(SUUIDonationResultViewController *)v10 setDonationAmount:v11];

    objc_super v12 = [(SUUIDonationStepViewController *)self operationQueue];
    [(SUUIDonationStepViewController *)v10 setOperationQueue:v12];

    v13 = [(SUUIDonationAmountViewController *)self navigationController];
    [v13 pushViewController:v10 animated:1];
  }
  else
  {
    if (v6)
    {
      v14 = [(SUUIDonationStepViewController *)self donationConfiguration];
      v15 = [v14 clientContext];

      v16 = (void *)MEMORY[0x263F82418];
      if (v15) {
        [v15 localizedStringForKey:@"DONATION_FLOW_UNABLE_TO_DONATE"];
      }
      else {
      v17 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_UNABLE_TO_DONATE" inBundles:0];
      }
      v18 = [v16 alertControllerWithTitle:v17 message:v23 preferredStyle:1];

      id v19 = (void *)MEMORY[0x263F82400];
      if (v15) {
        [v15 localizedStringForKey:@"DONATION_FLOW_OK_BUTTON"];
      }
      else {
      v20 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_OK_BUTTON" inBundles:0];
      }
      v21 = [v19 actionWithTitle:v20 style:0 handler:0];
      [v18 addAction:v21];

      [(SUUIDonationAmountViewController *)self presentViewController:v18 animated:1 completion:0];
    }
    [(SUUIDonationAmountViewController *)self _reenableAfterFailure];
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;
}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_lastValidationResponse, a3);
  id v6 = [(SUUIDonationAmountView *)self->_amountView selectedAmount];
  [(SUUIDonationAmountViewController *)self _setDonationButtonEnabled:v6 != 0];

  if (self->_tappedNextWhileValidating)
  {
    self->_tappedNextWhileValidating = 0;
    [(SUUIDonationAmountViewController *)self _performActionAfterValidation];
  }
}

- (void)_performActionAfterValidation
{
  if ([(SUUIGiftValidationResponse *)self->_lastValidationResponse isValid])
  {
    if (!self->_purchaseRequest)
    {
      objc_initWeak(&location, self);
      v3 = [SUUIGiftPurchaseRequest alloc];
      BOOL v4 = [(SUUIDonationAmountView *)self->_amountView selectedAmount];
      id v5 = [(SUUIDonationStepViewController *)self donationConfiguration];
      id v6 = [(SUUIGiftPurchaseRequest *)v3 initWithDonation:v4 configuration:v5];
      purchaseRequest = self->_purchaseRequest;
      self->_purchaseRequest = v6;

      v8 = self->_purchaseRequest;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke;
      v18[3] = &unk_265403A40;
      objc_copyWeak(&v19, &location);
      [(SUUIGiftPurchaseRequest *)v8 purchaseWithCompletionBlock:v18];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v9 = [(SUUIDonationStepViewController *)self donationConfiguration];
    id v17 = [v9 clientContext];

    id v10 = (void *)MEMORY[0x263F82418];
    if (v17) {
      [v17 localizedStringForKey:@"DONATION_FLOW_INVALID_DONATION"];
    }
    else {
    v11 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_INVALID_DONATION" inBundles:0];
    }
    objc_super v12 = [(SUUIGiftValidationResponse *)self->_lastValidationResponse errorString];
    v13 = [v10 alertControllerWithTitle:v11 message:v12 preferredStyle:1];

    v14 = (void *)MEMORY[0x263F82400];
    if (v17) {
      [v17 localizedStringForKey:@"DONATION_FLOW_OK_BUTTON"];
    }
    else {
    v15 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_OK_BUTTON" inBundles:0];
    }
    v16 = [v14 actionWithTitle:v15 style:0 handler:0];
    [v13 addAction:v16];

    [(SUUIDonationAmountViewController *)self presentViewController:v13 animated:1 completion:0];
    [(SUUIDonationAmountViewController *)self _reenableAfterFailure];
  }
}

void __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke_2;
  block[3] = &unk_265403A18;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishPurchaseWithResult:*(unsigned __int8 *)(a1 + 48) errorMessage:*(void *)(a1 + 32)];
}

- (void)_reenableAfterFailure
{
  [(SUUIDonationAmountView *)self->_amountView setUserInteractionEnabled:1];
  id v3 = [(SUUIDonationAmountView *)self->_amountView selectedAmount];
  [(SUUIDonationAmountViewController *)self _setDonationButtonEnabled:v3 != 0];
}

- (void)_setDonationButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(SUUIDonationAmountViewController *)self navigationItem];
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
    [(SUUIGiftValidator *)validator cancelValidation];
  }
  else
  {
    id v6 = [(SUUIDonationStepViewController *)self donationConfiguration];
    id v7 = [SUUIGiftValidator alloc];
    id v8 = [v6 donationValidationURL];
    id v9 = [v6 clientContext];
    char v10 = [(SUUIGiftValidator *)v7 initWithValidationURL:v8 clientContext:v9];
    v11 = self->_validator;
    self->_validator = v10;

    objc_super v12 = self->_validator;
    v13 = [(SUUIDonationStepViewController *)self operationQueue];
    [(SUUIGiftValidator *)v12 setOperationQueue:v13];
  }
  objc_initWeak(&location, self);
  v14 = self->_validator;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__SUUIDonationAmountViewController__validateDonation___block_invoke;
  v15[3] = &unk_265403A68;
  objc_copyWeak(&v16, &location);
  [(SUUIGiftValidator *)v14 validateDonation:v4 withCompletionBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __54__SUUIDonationAmountViewController__validateDonation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUUIDonationAmountViewController__validateDonation___block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __54__SUUIDonationAmountViewController__validateDonation___block_invoke_2(uint64_t a1)
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

@end