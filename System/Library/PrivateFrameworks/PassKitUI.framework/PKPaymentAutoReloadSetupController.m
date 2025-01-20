@interface PKPaymentAutoReloadSetupController
+ (BOOL)shouldOfferAutoReloadForPass:(id)a3;
- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 paymentDataProvider:(id)a4 provisioningController:(id)a5 viewStyle:(int64_t)a6 delegate:(id)a7;
- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 paymentDataProvider:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6;
- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 provisioningController:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (PKThresholdTopUpSetupViewController)thresholdTopUpSetupViewController;
- (id)_createThresholdTopUpSetupViewController;
- (id)paymentRequest:(id)a3 threshold:(id)a4 paymentMethodIdentifier:(id)a5;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_didUpdateAutoReloadWithAmount:(id)a3 threshold:(id)a4 paymentMethodIdentifier:(id)a5 completion:(id)a6;
- (void)_dismissViewController:(id)a3;
- (void)_showGenericErrorAlert:(id)a3;
- (void)autoReloadSetupCompleteViewControllerDidComplete;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)presentAutoTopUpFlow;
- (void)setReporter:(id)a3;
- (void)setThresholdTopUpSetupViewController:(id)a3;
- (void)thresholdTopUpDidSelectCancel:(id)a3;
- (void)thresholdTopUpDidSelectContinue:(id)a3 completion:(id)a4;
- (void)thresholdTopUpDidSelectUpdate:(id)a3 completion:(id)a4;
- (void)thresholdTopUpPerformCancel:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentAutoReloadSetupController

- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 provisioningController:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6
{
  return [(PKPaymentAutoReloadSetupController *)self initWithPass:a3 paymentDataProvider:0 provisioningController:a4 viewStyle:a5 delegate:a6];
}

- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 paymentDataProvider:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6
{
  return [(PKPaymentAutoReloadSetupController *)self initWithPass:a3 paymentDataProvider:a4 provisioningController:0 viewStyle:a5 delegate:a6];
}

- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 paymentDataProvider:(id)a4 provisioningController:(id)a5 viewStyle:(int64_t)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    id v15 = a7;
    self->_passUpdated = 0;
    objc_storeStrong((id *)&self->_paymentDataProvider, a4);
    if (objc_opt_respondsToSelector()) {
      [(PKPaymentDataProvider *)self->_paymentDataProvider addDelegate:self];
    }
    v16 = +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:v13];
    action = self->_action;
    self->_action = v16;

    uint64_t v18 = [(PKPaymentPass *)self->_pass autoTopUpMerchantTokenIdentifier];
    v19 = (void *)v18;
    if (v18) {
      LOBYTE(v18) = [(PKPaymentPass *)self->_pass isAutoTopEnabled];
    }
    self->_isWalletAutoTopEnabled = v18;

    self->_viewStyle = a6;
    objc_storeWeak((id *)&self->_delegate, v15);

    if (a5)
    {
      int64_t v20 = 2;
    }
    else
    {
      if (!self->_isWalletAutoTopEnabled)
      {
        self->_setupMode = 0;
        goto LABEL_11;
      }
      int64_t v20 = 1;
    }
    self->_setupMode = v20;
LABEL_11:
    v21 = [(PKPaymentAutoReloadSetupController *)self _createThresholdTopUpSetupViewController];
    thresholdTopUpSetupViewController = self->_thresholdTopUpSetupViewController;
    self->_thresholdTopUpSetupViewController = v21;
  }
  return self;
}

+ (BOOL)shouldOfferAutoReloadForPass:(id)a3
{
  id v3 = a3;
  v4 = +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:v3];
  if (v4) {
    int v5 = [v3 isAutoTopEnabled] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_createThresholdTopUpSetupViewController
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentPassAction *)self->_action autoTopUpItem];
  v4 = [v3 defaultAmountSuggestions];

  int v5 = [(PKPaymentPassAction *)self->_action autoTopUpItem];
  v6 = [v5 defaultThresholdSuggestions];

  v7 = [(PKPaymentPassAction *)self->_action autoTopUpItem];
  v8 = [v7 currency];
  currency = self->_currency;
  self->_currency = v8;

  if (self->_isWalletAutoTopEnabled)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v10 = [(PKPaymentPass *)self->_pass autoTopUpFields];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v49 = v4;
      id v13 = v6;
      uint64_t v14 = *(void *)v59;
      uint64_t v15 = *MEMORY[0x1E4F87500];
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(v10);
          }
          v17 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v18 = [v17 key];
          int v19 = [v18 isEqualToString:v15];

          if (v19)
          {
            id v22 = objc_alloc(MEMORY[0x1E4F28C28]);
            v23 = NSNumber;
            [v17 threshold];
            v24 = objc_msgSend(v23, "numberWithDouble:");
            v25 = v24;
            if (v24)
            {
              [v24 decimalValue];
            }
            else
            {
              v56[0] = 0;
              v56[1] = 0;
              int v57 = 0;
            }
            v6 = v13;
            v21 = (void *)[v22 initWithDecimal:v56];

            id v27 = objc_alloc(MEMORY[0x1E4F28C28]);
            v28 = NSNumber;
            [v17 amount];
            v29 = objc_msgSend(v28, "numberWithDouble:");
            v30 = v29;
            v4 = v49;
            if (v29)
            {
              [v29 decimalValue];
            }
            else
            {
              v54[0] = 0;
              v54[1] = 0;
              int v55 = 0;
            }
            int64_t v20 = [v27 initWithDecimal:v54];

            goto LABEL_20;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v65 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      int64_t v20 = 0;
      v21 = 0;
      v6 = v13;
      v4 = v49;
    }
    else
    {
      int64_t v20 = 0;
      v21 = 0;
    }
LABEL_20:

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v31 = [(PKPaymentPass *)self->_pass balances];
    v26 = (void *)[v31 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v26)
    {
      uint64_t v32 = *(void *)v51;
      while (2)
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v51 != v32) {
            objc_enumerationMutation(v31);
          }
          v34 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) paymentMethod];
          if (![v34 type])
          {
            v26 = [v34 name];
            v35 = [v34 fpanIdentifier];
            originalPaymentMethodIdentifier = self->_originalPaymentMethodIdentifier;
            self->_originalPaymentMethodIdentifier = v35;

            goto LABEL_30;
          }
        }
        v26 = (void *)[v31 countByEnumeratingWithState:&v50 objects:v64 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_30:

    if (v20)
    {
      if (!v21) {
        goto LABEL_35;
      }
      goto LABEL_37;
    }
  }
  else
  {
    v21 = 0;
    v26 = 0;
  }
  if ((unint64_t)[v4 count] < 2)
  {
    int64_t v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = [v4 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v45;
      _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "PKPaymentAutoReloadSetupController: defaultAmountSuggestions count [%lu] is less than 2 items per spec. Need to update server configuration for the actions.json.", buf, 0xCu);
    }
    goto LABEL_47;
  }
  int64_t v20 = [v4 firstObject];
  if (!v21)
  {
LABEL_35:
    if ((unint64_t)[v6 count] >= 2)
    {
      v21 = [v6 firstObject];
      goto LABEL_37;
    }
    v46 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v47 = [v6 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v47;
      _os_log_impl(&dword_19F450000, v46, OS_LOG_TYPE_DEFAULT, "PKPaymentAutoReloadSetupController: no defaultThresholdSuggestions [%lu] is less than 2 items per spec. Need to update server configuration for the actions.json.", buf, 0xCu);
    }

    v21 = 0;
LABEL_47:
    v37 = 0;
    goto LABEL_48;
  }
LABEL_37:
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  v37 = [[PKThresholdTopUpSetupViewController alloc] initWithAmountSuggestions:v4 selectedAmount:v20 thresholdSuggestions:v6 selectedThreshold:v21 currencyCode:self->_currency paymentMethodName:v26 paymentMethodIdentifier:self->_originalPaymentMethodIdentifier mode:self->_setupMode viewStyle:self->_viewStyle delegate:self];
  v38 = [(PKPaymentAutoReloadSetupController *)self paymentRequest:v20 threshold:v21 paymentMethodIdentifier:self->_originalPaymentMethodIdentifier];
  [(PKThresholdTopUpSetupViewController *)v37 setPaymentRequest:v38];

  v39 = PKLocalizedPaymentString(&cfstr_PassDetailsAmo.isa);
  [(PKThresholdTopUpSetupViewController *)v37 setAmountTitle:v39];

  v40 = PKLocalizedPaymentString(&cfstr_PassDetailsMin.isa);
  [(PKThresholdTopUpSetupViewController *)v37 setThresholdTitle:v40];

  int64_t setupMode = self->_setupMode;
  v42 = PKLocalizedPaymentString(&cfstr_PassDetailsAut.isa);
  if (setupMode == 1)
  {
    [(PKThresholdTopUpSetupViewController *)v37 setTitle:v42];

    v43 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_10.isa);
    [(PKThresholdTopUpSetupViewController *)v37 setCancelTitle:v43];

    if (![v26 length]) {
      goto LABEL_48;
    }
    v44 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_11.isa);
    [(PKThresholdTopUpSetupViewController *)v37 setPaymentMethodTitle:v44];
  }
  else
  {
    [(PKPaymentSetupOptionsViewController *)v37 setTitleText:v42];

    v44 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_12.isa);
    [(PKPaymentSetupOptionsViewController *)v37 setSubtitleText:v44];
  }

LABEL_48:

  return v37;
}

- (void)presentAutoTopUpFlow
{
  if (self->_thresholdTopUpSetupViewController)
  {
    int64_t setupMode = self->_setupMode;
    if (setupMode == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0) {
        return;
      }
      v9 = (PKNavigationController *)objc_loadWeakRetained((id *)&self->_delegate);
      [(PKNavigationController *)v9 autoReloadSetupController:self requestsPushViewController:self->_thresholdTopUpSetupViewController];
    }
    else
    {
      if (setupMode) {
        return;
      }
      id v4 = objc_loadWeakRetained((id *)&self->_delegate);
      char v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) == 0) {
        return;
      }
      v9 = [[PKNavigationController alloc] initWithRootViewController:self->_thresholdTopUpSetupViewController];
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 autoReloadSetupController:self requestsPresentViewController:v9];
    }
  }
}

- (void)autoReloadSetupCompleteViewControllerDidComplete
{
  int64_t setupMode = self->_setupMode;
  if (setupMode != 2)
  {
    if (setupMode == 1)
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
      {
LABEL_12:
        id v12 = objc_loadWeakRetained((id *)p_delegate);
        [v12 autoReloadSetupControllerDidCompleteWithAmount:self->_currentAmount threshold:self->_currentThreshold];
        goto LABEL_13;
      }
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 autoReloadSetupController:self requestsPopViewController:self->_thresholdTopUpSetupViewController];
    }
    else
    {
      if (setupMode) {
        return;
      }
      p_delegate = &self->_delegate;
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        goto LABEL_12;
      }
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 autoReloadSetupController:self requestsDismissViewController:self->_thresholdTopUpSetupViewController];
    }

    goto LABEL_12;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0) {
    return;
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportPageCompleted:0 context:0];
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  [v12 autoReloadSetupControllerDidCancel:self];
LABEL_13:
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentAutoReloadSetupController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __94__PKPaymentAutoReloadSetupController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 112))
    {
      *(unsigned char *)(v4 + 64) = 0;
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(NSObject **)(v5 + 128);
      if (v6)
      {
        dispatch_source_cancel(v6);
        uint64_t v7 = *(void *)(a1 + 32);
        id v8 = *(void **)(v7 + 128);
        *(void *)(v7 + 128) = 0;

        uint64_t v5 = *(void *)(a1 + 32);
      }
      (*(void (**)(void))(*(void *)(v5 + 112) + 16))();
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 112);
      *(void *)(v9 + 112) = 0;

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
        [v13 autoReloadSetupControllerDidCancel:*(void *)(a1 + 32)];
      }
      uint64_t v14 = *(void **)(a1 + 32);
      [v14 autoReloadSetupCompleteViewControllerDidComplete];
    }
  }
}

- (void)thresholdTopUpDidSelectCancel:(id)a3
{
  reporter = self->_reporter;
  id v5 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:2];
  [(PKPaymentAutoReloadSetupController *)self _dismissViewController:v5];
}

- (void)thresholdTopUpPerformCancel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_passUpdated = 0;
  objc_initWeak(&location, self);
  paymentDataProvider = self->_paymentDataProvider;
  uint64_t v9 = [(PKPaymentPass *)self->_pass uniqueID];
  v10 = [(PKPaymentPass *)self->_pass autoTopUpBalanceIdentifiers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke;
  v12[3] = &unk_1E59CAE30;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  v12[4] = self;
  id v13 = v11;
  [(PKPaymentDataProvider *)paymentDataProvider cancelAutoTopUpForPassWithUniqueIdentifier:v9 balanceIdentifiers:v10 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke(uint64_t a1, char a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_2;
  v5[3] = &unk_1E59D4388;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  char v8 = a2;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_7:
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
    }
    goto LABEL_13;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    char v8 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v9 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_13.isa);
    v10 = [*(id *)(*(void *)(a1 + 32) + 40) localizedDescription];
    id v11 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_14.isa, &stru_1EF1B4C70.isa, v10);
    char v12 = [v8 alertControllerWithTitle:v9 message:v11 preferredStyle:1];

    id v13 = (void *)MEMORY[0x1E4FB1410];
    id v14 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_15.isa);
    uint64_t v15 = [v13 actionWithTitle:v14 style:1 handler:0];
    [v12 addAction:v15];

    v16 = *(void **)(*(void *)(a1 + 32) + 88);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_4;
    v26[3] = &unk_1E59CAA98;
    id v27 = *(id *)(a1 + 40);
    [v16 presentViewController:v12 animated:1 completion:v26];

    goto LABEL_13;
  }
  if (*((unsigned char *)WeakRetained + 65))
  {
    *((unsigned char *)WeakRetained + 64) = 0;
    id v4 = objc_loadWeakRetained(WeakRetained + 13);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained(v3 + 13);
      [v6 autoReloadSetupControllerDidCancel:*(void *)(a1 + 32)];
    }
    [v3 autoReloadSetupCompleteViewControllerDidComplete];
    goto LABEL_7;
  }
  v17 = _Block_copy(*(const void **)(a1 + 40));
  id v18 = v3[14];
  v3[14] = v17;

  int v19 = v3[16];
  if (v19)
  {
    dispatch_source_cancel(v19);
    id v20 = v3[16];
    v3[16] = 0;
  }
  objc_initWeak(&location, v3);
  dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  id v22 = v3[16];
  v3[16] = v21;

  v23 = v3[16];
  dispatch_time_t v24 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v25 = v3[16];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_3;
  handler[3] = &unk_1E59CB010;
  objc_copyWeak(&v29, &location);
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler(v25, handler);
  dispatch_resume((dispatch_object_t)v3[16]);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
LABEL_13:
}

void __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 64) = 0;
    id v4 = *((void *)WeakRetained + 16);
    char v12 = v3;
    if (v4)
    {
      dispatch_source_cancel(v4);
      char v5 = (void *)v12[16];
      v12[16] = 0;

      int v3 = v12;
    }
    uint64_t v6 = v3[14];
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      uint64_t v7 = (void *)v12[14];
      v12[14] = 0;

      int v3 = v12;
    }
    char v8 = (id *)(v3 + 13);
    id v9 = objc_loadWeakRetained((id *)v3 + 13);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained(v8);
      [v11 autoReloadSetupControllerDidCancel:*(void *)(a1 + 32)];
    }
    [v12 autoReloadSetupCompleteViewControllerDidComplete];
    int v3 = v12;
  }
}

uint64_t __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)thresholdTopUpDidSelectContinue:(id)a3 completion:(id)a4
{
  reporter = self->_reporter;
  id v7 = a4;
  id v8 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:0];
  id v12 = [v8 currentAmount];
  id v9 = [v8 currentThreshold];
  char v10 = [v8 selectedPass];

  id v11 = [v10 primaryAccountIdentifier];
  [(PKPaymentAutoReloadSetupController *)self _didUpdateAutoReloadWithAmount:v12 threshold:v9 paymentMethodIdentifier:v11 completion:v7];
}

- (void)thresholdTopUpDidSelectUpdate:(id)a3 completion:(id)a4
{
  reporter = self->_reporter;
  id v7 = a4;
  id v8 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:1];
  id v12 = [v8 currentAmount];
  id v9 = [v8 currentThreshold];
  char v10 = [v8 selectedPass];

  id v11 = [v10 primaryAccountIdentifier];
  [(PKPaymentAutoReloadSetupController *)self _didUpdateAutoReloadWithAmount:v12 threshold:v9 paymentMethodIdentifier:v11 completion:v7];
}

- (void)_dismissViewController:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 mode];
  switch(v4)
  {
    case 2:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_delegate);
        [v10 autoReloadSetupControllerDidCancel:self];

        [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportPageCompleted:0 context:0];
      }
      break;
    case 1:
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        break;
      }
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 autoReloadSetupController:self requestsPopViewController:v13];
      goto LABEL_10;
    case 0:
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v7 = objc_loadWeakRetained((id *)&self->_delegate);
        [v7 autoReloadSetupController:self requestsDismissViewController:v13];
LABEL_10:
      }
      break;
  }
}

- (id)paymentRequest:(id)a3 threshold:(id)a4 paymentMethodIdentifier:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v67 = (NSString *)a5;
  currency = self->_currency;
  id v11 = objc_alloc(MEMORY[0x1E4F84610]);
  char v12 = v11;
  v68 = v9;
  if (currency)
  {
    id v13 = (PKCurrencyAmount *)[v11 initWithAmount:v8 currency:self->_currency exponent:0];
    currentAmount = self->_currentAmount;
    self->_currentAmount = v13;

    uint64_t v15 = (PKCurrencyAmount *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v9 currency:self->_currency exponent:0];
    currentThreshold = self->_currentThreshold;
    self->_currentThreshold = v15;
  }
  else
  {
    v17 = [(PKThresholdTopUpSetupViewController *)self->_thresholdTopUpSetupViewController currentAmount];
    id v18 = (PKCurrencyAmount *)[v12 initWithAmount:v17 currency:self->_currency exponent:0];
    int v19 = self->_currentAmount;
    self->_currentAmount = v18;

    id v20 = objc_alloc(MEMORY[0x1E4F84610]);
    currentThreshold = [(PKThresholdTopUpSetupViewController *)self->_thresholdTopUpSetupViewController currentThreshold];
    dispatch_source_t v21 = (PKCurrencyAmount *)[v20 initWithAmount:currentThreshold currency:self->_currency exponent:0];
    id v22 = self->_currentThreshold;
    self->_currentThreshold = v21;
  }
  v69 = v8;

  uint64_t v66 = self;
  v23 = [(PKPaymentPass *)self->_pass autoTopUpFields];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    v26 = 0;
    uint64_t v27 = *(void *)v71;
    uint64_t v28 = *MEMORY[0x1E4F87508];
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v71 != v27) {
          objc_enumerationMutation(v23);
        }
        v30 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v31 = [v30 key];
        int v32 = [v31 isEqualToString:v28];

        if (v32)
        {
          v33 = (void *)MEMORY[0x1E4F1CB10];
          v34 = [v30 link];
          uint64_t v35 = [v33 URLWithString:v34];

          v26 = (void *)v35;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v25);
  }
  else
  {
    v26 = 0;
  }
  uint64_t v36 = [(PKPaymentPass *)v66->_pass transactionServiceURL];
  uint64_t v37 = PKLocalizedPaymentString(&cfstr_PassDetailsRel.isa);
  uint64_t v63 = [(PKPaymentPass *)v66->_pass organizationName];
  v38 = [MEMORY[0x1E4F84538] summaryItemWithLabel:v37 amount:v69 type:0];
  [v38 setThresholdAmount:v68];
  v64 = (void *)v37;
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F84530]) initWithPaymentDescription:v37 automaticReloadBilling:v38 managementURL:v26];
  v65 = (void *)v36;
  [v39 setTokenNotificationURL:v36];
  v40 = [(PKPaymentPass *)v66->_pass localizedDescription];
  v41 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_16.isa, &stru_1EF1B4C70.isa, v40);
  [v39 setBillingAgreement:v41];

  v42 = [(PKPaymentPassAction *)v66->_action autoTopUpItem];
  v43 = [v42 serviceProviderData];
  v44 = (void *)[v43 mutableCopy];

  [v44 setObject:v69 forKey:*MEMORY[0x1E4F87D40]];
  [v44 setObject:v68 forKey:*MEMORY[0x1E4F87D48]];
  [v44 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F87D58]];
  if (v67)
  {
    uint64_t v45 = *MEMORY[0x1E4F87530];
    v46 = v44;
    originalPaymentMethodIdentifier = v67;
LABEL_18:
    [v46 setObject:originalPaymentMethodIdentifier forKey:v45];
    goto LABEL_19;
  }
  originalPaymentMethodIdentifier = v66->_originalPaymentMethodIdentifier;
  uint64_t v45 = *MEMORY[0x1E4F87530];
  v46 = v44;
  if (originalPaymentMethodIdentifier) {
    goto LABEL_18;
  }
  [v44 setValue:0 forKey:v45];
LABEL_19:
  id v48 = objc_alloc_init(MEMORY[0x1E4F84838]);
  v49 = [(PKPaymentPassAction *)v66->_action actionDescription];
  [v48 setItemDescription:v49];

  long long v50 = (void *)[v44 copy];
  [v48 setServiceProviderData:v50];

  long long v51 = [(PKPaymentPassAction *)v66->_action serviceProviderIdentifier];
  [v48 setServiceProviderIdentifier:v51];

  long long v52 = (void *)[objc_alloc(MEMORY[0x1E4F84FF0]) initWithServiceProviderOrder:v48];
  [v52 setCurrencyCode:v66->_currency];
  long long v53 = [(PKPaymentPassAction *)v66->_action serviceProviderAcceptedNetworks];
  [v52 setSupportedNetworks:v53];

  objc_msgSend(v52, "setMerchantCapabilities:", -[PKPaymentPassAction serviceProviderCapabilities](v66->_action, "serviceProviderCapabilities"));
  v54 = [(PKPaymentPassAction *)v66->_action serviceProviderCountryCode];
  [v52 setCountryCode:v54];

  int v55 = [(PKPaymentPassAction *)v66->_action serviceProviderSupportedCountries];
  [v52 setSupportedCountries:v55];

  v56 = (void *)[v38 copy];
  uint64_t v57 = [(PKPaymentPassAction *)v66->_action serviceProviderLocalizedDisplayName];
  long long v58 = (void *)v57;
  if (v57) {
    long long v59 = (void *)v57;
  }
  else {
    long long v59 = v63;
  }
  id v60 = v59;

  [v56 setLabel:v60];
  v74 = v56;
  long long v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  [v52 setPaymentSummaryItems:v61];

  [v52 setAutomaticReloadPaymentRequest:v39];
  [v52 setConfirmationStyle:1];

  return v52;
}

- (void)_didUpdateAutoReloadWithAmount:(id)a3 threshold:(id)a4 paymentMethodIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = [(PKPaymentAutoReloadSetupController *)self paymentRequest:v10 threshold:v11 paymentMethodIdentifier:v12];
  if (self->_paymentAuthCompletionHandler)
  {
    if (v13) {
      v13[2](v13, 0);
    }
  }
  else
  {
    uint64_t v15 = _Block_copy(v13);
    id paymentAuthCompletionHandler = self->_paymentAuthCompletionHandler;
    self->_id paymentAuthCompletionHandler = v15;

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:v14];
    [v17 setDelegate:self];
    [v17 _setPrivateDelegate:self];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke;
    v18[3] = &unk_1E59CB100;
    objc_copyWeak(&v19, &location);
    [v17 presentWithCompletion:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E59CDA78;
  char v5 = a2;
  v4[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v6 = 0;
      _os_log_error_impl(&dword_19F450000, v2, OS_LOG_TYPE_ERROR, "Error: Device failed to present payment coordinator!", v6, 2u);
    }

    [*(id *)(a1 + 32) _showGenericErrorAlert:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 120);
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      uint64_t v4 = *(void *)(a1 + 32);
      char v5 = *(void **)(v4 + 120);
      *(void *)(v4 + 120) = 0;
    }
  }
}

- (void)_showGenericErrorAlert:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F84B50] displayableErrorForAction:self->_action andReason:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportError:v5 context:0];
  char v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = [v5 localizedDescription];
  id v8 = [v5 localizedRecoverySuggestion];
  id v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PKPaymentAutoReloadSetupController__showGenericErrorAlert___block_invoke;
  v14[3] = &unk_1E59CB150;
  id v15 = v4;
  id v12 = v4;
  id v13 = [v10 actionWithTitle:v11 style:1 handler:v14];
  [v9 addAction:v13];

  [(PKThresholdTopUpSetupViewController *)self->_thresholdTopUpSetupViewController presentViewController:v9 animated:1 completion:0];
}

uint64_t __61__PKPaymentAutoReloadSetupController__showGenericErrorAlert___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  char v5 = (objc_class *)MEMORY[0x1E4F84A30];
  char v6 = (void (**)(id, id))a5;
  id v7 = objc_alloc_init(v5);
  [v7 setStatus:1];
  v6[2](v6, v7);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

void __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  if (v3)
  {
    *(void *)(v2 + 56) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 96) == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 104));
      [WeakRetained autoReloadSetupControllerDidCompleteWithAmount:*(void *)(*(void *)(a1 + 32) + 8) threshold:*(void *)(*(void *)(a1 + 32) + 16)];

      [*(id *)(*(void *)(a1 + 32) + 136) reportPageCompleted:1 context:0];
    }
    else
    {
      char v6 = -[PKPaymentAutoReloadSetupCompleteViewController initWithPass:amount:threshold:setupMode:paymentDataProvider:delegate:]([PKPaymentAutoReloadSetupCompleteViewController alloc], "initWithPass:amount:threshold:setupMode:paymentDataProvider:delegate:", *(void *)(*(void *)(a1 + 32) + 40), *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 96), *(void *)(*(void *)(a1 + 32) + 80));
      id v7 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
      [v7 pushViewController:v6 animated:1];
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 120);
  if (v9)
  {
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, *(void *)(v8 + 56) != 0);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 120);
    *(void *)(v10 + 120) = 0;
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  uint64_t v3 = [(PKThresholdTopUpSetupViewController *)self->_thresholdTopUpSetupViewController view];
  uint64_t v4 = [v3 window];
  char v5 = [v4 windowScene];
  char v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)&self->_completedAutoReload, a4);
    uint64_t v8 = (void (**)(id, void))a5;
    v8[2](v8, 0);
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

- (PKThresholdTopUpSetupViewController)thresholdTopUpSetupViewController
{
  return self->_thresholdTopUpSetupViewController;
}

- (void)setThresholdTopUpSetupViewController:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_paymentAuthCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_thresholdTopUpSetupViewController, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_completedAutoReload, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_originalPaymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_currentThreshold, 0);

  objc_storeStrong((id *)&self->_currentAmount, 0);
}

@end