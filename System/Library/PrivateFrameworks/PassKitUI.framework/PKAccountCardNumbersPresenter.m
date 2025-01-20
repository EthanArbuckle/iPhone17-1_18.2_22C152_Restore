@interface PKAccountCardNumbersPresenter
+ (void)authAndDecryptWithVirtualCard:(id)a3 completion:(id)a4;
- (BOOL)isLoadingVirtualCard;
- (PKAccountCardNumbersPresenter)initWithVirtualCard:(id)a3 physicalCard:(id)a4 account:(id)a5 peerPaymentAccount:(id)a6 pass:(id)a7 context:(int64_t)a8;
- (void)_prepareAuthForVirtualCard:(id)a3 completion:(id)a4;
- (void)presentCardNumbersWithCompletion:(id)a3;
@end

@implementation PKAccountCardNumbersPresenter

- (PKAccountCardNumbersPresenter)initWithVirtualCard:(id)a3 physicalCard:(id)a4 account:(id)a5 peerPaymentAccount:(id)a6 pass:(id)a7 context:(int64_t)a8
{
  id v24 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountCardNumbersPresenter;
  v18 = [(PKAccountCardNumbersPresenter *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_virtualCard, a3);
    objc_storeStrong((id *)&v19->_physicalCard, a4);
    objc_storeStrong((id *)&v19->_account, a5);
    objc_storeStrong((id *)&v19->_peerPaymentAccount, a6);
    objc_storeStrong((id *)&v19->_pass, a7);
    v19->_context = a8;
    uint64_t v20 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v19->_accountService;
    v19->_accountService = (PKAccountService *)v20;

    v19->_isLoadingVirtualCard = 0;
  }

  return v19;
}

- (void)presentCardNumbersWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_24;
  }
  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount) {
    BOOL v6 = [(PKPeerPaymentAccount *)peerPaymentAccount state] == 3
  }
      || [(PKPeerPaymentAccount *)self->_peerPaymentAccount state] == 4;
  else {
    BOOL v6 = 0;
  }
  v7 = [MEMORY[0x1E4F84D50] sharedService];
  if (PKVirtualCardEnabledWithWebService()
    && ([(PKAccount *)self->_account supportsShowVirtualCard] & 1) == 0
    && [(PKPaymentPass *)self->_pass hasActiveVirtualCard])
  {

    if (!v6)
    {
      objc_initWeak(location, self);
      self->_isLoadingVirtualCard = 1;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke;
      v26[3] = &unk_1E59D54C0;
      objc_copyWeak(&v28, location);
      v26[4] = self;
      id v27 = v4;
      +[PKCardNumbersAuthentication authenticationContextLocationBased:1 featureIdentifier:1 completion:v26];

      v8 = &v28;
LABEL_33:
      objc_destroyWeak(v8);
      objc_destroyWeak(location);
      goto LABEL_24;
    }
  }
  else
  {
  }
  if (([(PKAccount *)self->_account supportsShowVirtualCard] & 1) == 0)
  {
    v10 = [[PKAccountOtherCardNumbersViewController alloc] initWithPaymentPass:self->_pass account:0 context:self->_context preferDefaultTitle:v6];
LABEL_23:
    v12 = v10;
    (*((void (**)(id, PKAccountOtherCardNumbersViewController *))v4 + 2))(v4, v10);

    goto LABEL_24;
  }
  if (![(PKAccount *)self->_account supportsShowVirtualCard])
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Account doesn't support showing virtual card", (uint8_t *)location, 2u);
    }

    v10 = [[PKAccountCardNumbersViewController alloc] initWithPass:self->_pass accountService:self->_accountService account:self->_account physicalCard:self->_physicalCard context:self->_context];
    goto LABEL_23;
  }
  if (!self->_isLoadingVirtualCard)
  {
    self->_isLoadingVirtualCard = 1;
    virtualCard = self->_virtualCard;
    if (!virtualCard)
    {
      v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Card information selected: no virtual cards on the account, calling create", (uint8_t *)location, 2u);
      }

      objc_initWeak(location, self);
      accountService = self->_accountService;
      id v15 = [(PKAccount *)self->_account accountIdentifier];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_20;
      v20[3] = &unk_1E59D5510;
      objc_copyWeak(&v22, location);
      id v21 = v4;
      [(PKAccountService *)accountService createVirtualCard:1 forAccountIdentifier:v15 completion:v20];

      v8 = &v22;
      goto LABEL_33;
    }
    if ([(PKVirtualCard *)virtualCard hasSensitiveCredentials])
    {
      [(PKAccountCardNumbersPresenter *)self _prepareAuthForVirtualCard:self->_virtualCard completion:v4];
      self->_isLoadingVirtualCard = 0;
    }
    else
    {
      if ((PKUIOnlyDemoModeEnabled() & 1) == 0)
      {
        id v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Card information selected: attempting to fetch virtual card", (uint8_t *)location, 2u);
        }

        objc_initWeak(location, self);
        id v17 = self->_accountService;
        v18 = [(PKVirtualCard *)self->_virtualCard identifier];
        v19 = [(PKAccount *)self->_account accountIdentifier];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_16;
        v23[3] = &unk_1E59D5510;
        objc_copyWeak(&v25, location);
        id v24 = v4;
        [(PKAccountService *)v17 performVirtualCardAction:1 forVirtualCardIdentifier:v18 forAccountIdentifier:v19 completion:v23];

        v8 = &v25;
        goto LABEL_33;
      }
      self->_isLoadingVirtualCard = 0;
      [(PKAccountCardNumbersPresenter *)self _prepareAuthForVirtualCard:self->_virtualCard completion:v4];
    }
  }
LABEL_24:
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2;
    block[3] = &unk_1E59CF3E0;
    block[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    id v11 = WeakRetained;
    id v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  if (*(void *)(a1 + 40) && !*(void *)(a1 + 48))
  {
    id v6 = [[PKAccountCardNumbersViewController alloc] initWithPass:*(void *)(*(void *)(a1 + 56) + 40) localAuthenticationContext:*(void *)(a1 + 40) virtualCard:*(void *)(*(void *)(a1 + 56) + 8) context:*(void *)(*(void *)(a1 + 56) + 48)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Card information selected: unable to present card numbers UI because auth failed with error: %@", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 48), "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1))
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      id v4 = +[PKCardNumbersAuthentication genericDisplayableVirtualCardError];
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_17;
  block[3] = &unk_1E59D54E8;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  id v17 = *(id *)(a1 + 32);
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_17(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 64) = 0;
    id v4 = *(void **)(a1 + 32);
    if (v4 && !*(void *)(a1 + 40))
    {
      objc_storeStrong(WeakRetained + 1, v4);
      objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
      if ([v3[1] hasSensitiveCredentials])
      {
        [v3 _prepareAuthForVirtualCard:v3[1] completion:*(void *)(a1 + 56)];
        goto LABEL_8;
      }
      id v7 = [[PKAccountCardNumbersViewController alloc] initWithPass:v3[5] accountService:v3[7] account:v3[3] cardCredentials:0 virtualCard:v3[1] physicalCard:v3[2] context:v3[6]];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Card information selected: unable to present card numbers UI because virtual card action failed with error: %@", buf, 0xCu);
      }

      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 40), [v3[3] feature], 0, 0);
      id v7 = (PKAccountCardNumbersViewController *)objc_claimAutoreleasedReturnValue();
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
LABEL_8:
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_20(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_21;
  block[3] = &unk_1E59D54E8;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  id v17 = *(id *)(a1 + 32);
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_21(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 64) = 0;
    id v4 = *(void **)(a1 + 32);
    if (v4 && !*(void *)(a1 + 40))
    {
      objc_storeStrong(WeakRetained + 1, v4);
      objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
      if ([v3[1] hasSensitiveCredentials])
      {
        [v3 _prepareAuthForVirtualCard:v3[1] completion:*(void *)(a1 + 56)];
        goto LABEL_8;
      }
      id v7 = [[PKAccountCardNumbersViewController alloc] initWithPass:v3[5] accountService:v3[7] account:v3[3] cardCredentials:0 virtualCard:v3[1] physicalCard:v3[2] context:v3[6]];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Unable to present card numbers UI because create virtual card failed with error: %@", buf, 0xCu);
      }

      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 40), [v3[3] feature], 0, 0);
      id v7 = (PKAccountCardNumbersViewController *)objc_claimAutoreleasedReturnValue();
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
LABEL_8:
}

- (void)_prepareAuthForVirtualCard:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to auth to decrypt virtual card", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v9 = objc_opt_class();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke;
  v12[3] = &unk_1E59D5538;
  objc_copyWeak(&v15, buf);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 authAndDecryptWithVirtualCard:v10 completion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke_2;
    v11[3] = &unk_1E59D2148;
    id v12 = v7;
    id v13 = v8;
    id v14 = WeakRetained;
    id v15 = a1[4];
    id v16 = v9;
    id v17 = a1[5];
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    id v8 = [PKAccountCardNumbersViewController alloc];
    id v9 = *(void **)(a1 + 48);
    id v7 = [(PKAccountCardNumbersViewController *)v8 initWithPass:v9[5] accountService:v9[7] account:v9[3] cardCredentials:*(void *)(a1 + 32) virtualCard:*(void *)(a1 + 56) physicalCard:v9[2] context:v9[6]];
  }
  else
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Auth and decrypt virtual card failed with error: %@", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 64) domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F85B98]];

    if (v5)
    {
      id v6 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 64), [*(id *)(*(void *)(a1 + 48) + 24) feature], 0, 0);
      id v7 = (PKAccountCardNumbersViewController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    }
    else
    {
      id v7 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

+ (void)authAndDecryptWithVirtualCard:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke;
    v7[3] = &unk_1E59D5588;
    id v8 = v5;
    id v9 = v6;
    +[PKCardNumbersAuthentication authenticationContextLocationBased:1 featureIdentifier:2 completion:v7];
  }
}

void __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 externalizedContext];
  if (v7)
  {
    if (PKUIOnlyDemoModeEnabled())
    {
      if (*(void *)(a1 + 40))
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F85110]);
        [v8 setPrimaryAccountNumber:@"1234567890"];
        [v8 setCardSecurityCode:@"123"];
        [v8 setCardType:3];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F84270] sharedInstance];
      uint64_t v11 = *(void *)(a1 + 32);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke_2;
      v12[3] = &unk_1E59D5560;
      id v13 = v5;
      id v14 = *(id *)(a1 + 40);
      [v10 cardCredentialsForVirtualCard:v11 authorization:v7 action:1 completion:v12];
    }
  }
  else if (*(void *)(a1 + 40))
  {
    if (objc_msgSend(v6, "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1)) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    (*(void (**)(void, void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v6, v9);
  }
}

void __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 invalidate];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (!v11 || v5)
    {
      id v8 = 0;
      id v9 = v5;
      id v10 = v5;
    }
    else
    {
      id v8 = v11;
      id v9 = 0;
      id v10 = 0;
    }
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v8, v9, v10);
  }
}

- (BOOL)isLoadingVirtualCard
{
  return self->_isLoadingVirtualCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);

  objc_storeStrong((id *)&self->_virtualCard, 0);
}

@end