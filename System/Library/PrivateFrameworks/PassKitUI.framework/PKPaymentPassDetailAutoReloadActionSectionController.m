@interface PKPaymentPassDetailAutoReloadActionSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (PKPaymentPassDetailAutoReloadActionSectionController)initWithPass:(id)a3 paymentDataProvider:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6;
- (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate)setupDelegate;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4;
- (void)autoReloadSetupController:(id)a3 requestsPopViewController:(id)a4;
- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4;
- (void)autoReloadSetupController:(id)a3 requestsPushViewController:(id)a4;
- (void)autoReloadSetupControllerDidCancel:(id)a3;
- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4;
- (void)launchURL:(id)a3;
- (void)presentAutoReloadSetupViewController;
- (void)setSetupDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPaymentPassDetailAutoReloadActionSectionController

- (PKPaymentPassDetailAutoReloadActionSectionController)initWithPass:(id)a3 paymentDataProvider:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentPassDetailAutoReloadActionSectionController;
  v14 = [(PKPaymentPassDetailSectionController *)&v30 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v16 = [v11 autoTopUpMerchantTokenIdentifier];
    if (v16) {
      char v17 = 0;
    }
    else {
      char v17 = [v11 isAutoTopEnabled];
    }
    v15->_isMerchantAutoTopEnabled = v17;

    uint64_t v18 = [v11 autoTopUpMerchantTokenIdentifier];
    v19 = (void *)v18;
    if (v18) {
      LOBYTE(v18) = [v11 isAutoTopEnabled];
    }
    v15->_isWalletAutoTopEnabled = v18;

    uint64_t v20 = [v11 localizedDescription];
    name = v15->_name;
    v15->_name = (NSString *)v20;

    v15->_viewStyle = a5;
    v22 = +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:v11];
    uint64_t v23 = +[PKPaymentPassDetailAutoReloadSectionController autoReloadThresholdForPass:v11 action:v22];
    threshold = v15->_threshold;
    v15->_threshold = (NSString *)v23;

    uint64_t v25 = +[PKPaymentPassDetailAutoReloadSectionController autoReloadAmountForPass:v11 action:v22];
    reloadAmount = v15->_reloadAmount;
    v15->_reloadAmount = (NSString *)v25;

    v27 = [[PKPaymentAutoReloadSetupController alloc] initWithPass:v11 paymentDataProvider:v12 viewStyle:v15->_viewStyle delegate:v15];
    autoReloadSetupController = v15->_autoReloadSetupController;
    v15->_autoReloadSetupController = v27;
  }
  return v15;
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AutoReloadActionSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment])
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKPaymentPassDetailAutoReloadActionSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3 = a3;
  if ([v3 activationState])
  {
    char v4 = 0;
  }
  else
  {
    v5 = +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:v3];
    if (v5) {
      char v4 = 1;
    }
    else {
      char v4 = [v3 isAutoTopEnabled];
    }
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6 = a3;
  v7 = [v6 dequeueReusableCellWithIdentifier:@"AutoReloadCellIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"AutoReloadCellIdentifier"];
  }
  BOOL isMerchantAutoTopEnabled = self->_isMerchantAutoTopEnabled;
  v9 = PKLocalizedPaymentString(&cfstr_PassDetailsAut.isa);
  if (isMerchantAutoTopEnabled)
  {
    v10 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v9 detailText:self->_name cellStyle:1 forTableView:v6];
  }
  else
  {
    if (self->_isWalletAutoTopEnabled) {
      id v11 = @"STATE_ON";
    }
    else {
      id v11 = @"STATE_OFF";
    }
    uint64_t v12 = PKLocalizedPaymentString(&v11->isa);
    v10 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v9 detailText:v12 cellStyle:1 forTableView:v6];

    v7 = (void *)v12;
  }

  [v10 setAccessoryType:1];

  return v10;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_isMerchantAutoTopEnabled)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = PKLocalizedPaymentString(&cfstr_PassDetailsSet.isa);
  }

  return v6;
}

- (void)launchURL:(id)a3
{
  id v8 = a3;
  p_setupDelegate = &self->_setupDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_setupDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_setupDelegate);
    [v7 launchURL:v8];
  }
}

- (void)presentAutoReloadSetupViewController
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_0.isa);
  v5 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_1.isa, &stru_1EF1B4C70.isa, self->_name);
  char v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PKLocalizedPaymentString(&cfstr_PassDetailsSet_0.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__PKPaymentPassDetailAutoReloadActionSectionController_presentAutoReloadSetupViewController__block_invoke;
  v14[3] = &unk_1E59CB1F0;
  v14[4] = self;
  v9 = [v7 actionWithTitle:v8 style:0 handler:v14];
  [v6 addAction:v9];

  v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = PKLocalizedPaymentString(&cfstr_PassDetailsSet_1.isa, &stru_1EF1B4C70.isa, self->_name);
  uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:0];
  [v6 addAction:v12];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained presentViewController:v6 animated:1 completion:0];
}

uint64_t __92__PKPaymentPassDetailAutoReloadActionSectionController_presentAutoReloadSetupViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) presentAutoTopUpFlow];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  if (PKEqualObjects())
  {
    [v11 deselectRowAtIndexPath:v7 animated:1];
    if (self->_isMerchantAutoTopEnabled)
    {
      id v8 = [[PKPaymentPassDetailAutoReloadMerchantViewController alloc] initWithPass:self->_pass viewStyle:self->_viewStyle delegate:self];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = [WeakRetained navigationController];
      [v10 pushViewController:v8 animated:1];
    }
    else
    {
      [(PKPaymentAutoReloadSetupController *)self->_autoReloadSetupController presentAutoTopUpFlow];
    }
  }
}

- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  [WeakRetained autoReloadSetupControllerDidComplete];
}

- (void)autoReloadSetupControllerDidCancel:(id)a3
{
  self->_isWalletAutoTopEnabled = 0;
  self->_BOOL isMerchantAutoTopEnabled = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSectionIdentifier:@"AutoReloadActionSection"];
}

- (void)autoReloadSetupController:(id)a3 requestsPushViewController:(id)a4
{
  p_delegate = &self->_delegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = [WeakRetained navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4
{
  p_delegate = &self->_delegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained presentViewController:v5 animated:1 completion:0];
}

- (void)autoReloadSetupController:(id)a3 requestsPopViewController:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];
}

- (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoReloadSetupController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_threshold, 0);

  objc_storeStrong((id *)&self->_reloadAmount, 0);
}

@end