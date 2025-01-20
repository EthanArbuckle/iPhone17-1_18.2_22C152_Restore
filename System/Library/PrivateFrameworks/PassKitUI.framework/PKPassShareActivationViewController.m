@interface PKPassShareActivationViewController
- (PKPassShareActivationViewController)init;
- (PKPassShareActivationViewController)initWithPendingActivation:(id)a3;
- (void)_showError:(id)a3;
- (void)activationCodeDidChangeToCode:(id)a3;
- (void)cancelButtonPressed;
- (void)continueButtonPressed;
- (void)loadCardArt;
- (void)loadView;
@end

@implementation PKPassShareActivationViewController

- (PKPassShareActivationViewController)init
{
  return 0;
}

- (PKPassShareActivationViewController)initWithPendingActivation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassShareActivationViewController;
  v6 = [(PKPassShareRedemptionViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pendingActivation, a3);
  }

  return v7;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassShareActivationViewController;
  [(PKPassShareRedemptionViewController *)&v8 loadView];
  [(PKPassShareActivationViewController *)self loadCardArt];
  v3 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_1.isa);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  v4 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_2.isa);
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v4];

  id v5 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  [v5 showLoadingContent];

  v6 = [(PKPassSharePendingActivation *)self->_pendingActivation originalInvitation];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v6 activationOptions], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    [(PKPassShareActivationViewController *)self _showError:0];
    v7 = 0;
  }
  [(PKPassShareRedemptionViewController *)self setActivationOptions:v7];
}

- (void)loadCardArt
{
  v3 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  v4 = [(PKPassSharePendingActivation *)self->_pendingActivation originalInvitation];
  id v5 = [v4 displayInformation];
  v6 = [v5 imageURL];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__PKPassShareActivationViewController_loadCardArt__block_invoke;
    v7[3] = &unk_1E59CD9B0;
    id v8 = v3;
    PKCommonCachedImageFromURL(v6, v7);
  }
  else
  {
    [v3 hideLoadingContent];
  }
}

uint64_t __50__PKPassShareActivationViewController_loadCardArt__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCardImage:");
  v2 = *(void **)(a1 + 32);

  return [v2 hideLoadingContent];
}

- (void)_showError:(id)a3
{
  v4 = (NSError *)a3;
  [(PKPassShareRedemptionViewController *)self showFailureUI];
  BOOL v19 = 0;
  id v5 = PKSharingDisplayableError(v4, &v19);

  if (!v5)
  {
    BOOL v19 = 1;
    v6 = [MEMORY[0x1E4F28C58] pkSharingError:6];
    id v5 = PKSharingDisplayableError(v6);
  }
  v7 = PKTitleForDisplayableError();
  id v8 = MEMORY[0x1A6221F20](v5);
  objc_super v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  v10 = (void *)MEMORY[0x1E4FB1410];
  if (v19)
  {
    v11 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__PKPassShareActivationViewController__showError___block_invoke;
    v18[3] = &unk_1E59CB1F0;
    v18[4] = self;
    v12 = v18;
    v13 = v10;
    v14 = v11;
    uint64_t v15 = 1;
  }
  else
  {
    v11 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__PKPassShareActivationViewController__showError___block_invoke_2;
    v17[3] = &unk_1E59CB1F0;
    v17[4] = self;
    v12 = v17;
    v13 = v10;
    v14 = v11;
    uint64_t v15 = 0;
  }
  v16 = [v13 actionWithTitle:v14 style:v15 handler:v12];
  [v9 addAction:v16];

  [(PKPassShareActivationViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __50__PKPassShareActivationViewController__showError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __50__PKPassShareActivationViewController__showError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showStartingUI];
}

- (void)cancelButtonPressed
{
}

- (void)continueButtonPressed
{
  if ([(NSString *)self->_activationCode length])
  {
    [(PKPassShareRedemptionViewController *)self showLoadingUI];
    id v3 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    objc_initWeak(&location, self);
    v4 = [(PKPassSharePendingActivation *)self->_pendingActivation originalInvitation];
    activationCode = self->_activationCode;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke;
    v6[3] = &unk_1E59CDA00;
    v6[4] = self;
    objc_copyWeak(&v7, &location);
    [v3 acceptCarKeyShareForMessage:v4 activationCode:activationCode completion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_2;
  v9[3] = &unk_1E59CD9D8;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], v9);
  objc_destroyWeak(&v12);
}

void __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (id *)*(id *)(a1 + 32);
  id v3 = v2;
  if (v2)
  {
    if (*(void *)(a1 + 40)) {
      BOOL v4 = *(void *)(a1 + 48) == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v3[171] shareIdentifier];
        *(_DWORD *)buf = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Successfully redeemed share %@", buf, 0xCu);
      }
      id v7 = PKLocalizedShareableCredentialString(&cfstr_DoneAddingShar.isa);
      [v3 setTitleText:v7];

      [v3 showSuccessUI];
      dispatch_time_t v8 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_34;
      block[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v10, (id *)(a1 + 56));
      dispatch_after(v8, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v10);
    }
    else
    {
      objc_msgSend(v2, "_showError:");
    }
  }
}

void __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)activationCodeDidChangeToCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActivation, 0);

  objc_storeStrong((id *)&self->_activationCode, 0);
}

@end