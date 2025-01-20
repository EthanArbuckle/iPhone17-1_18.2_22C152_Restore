@interface PKPeerPaymentThresholdTopUpController
- (PKPeerPaymentThresholdTopUpController)initWithPeerPaymentAccount:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7;
- (id)_messageForErrorCode:(unint64_t)a3;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_setupCompleteImage;
- (id)_titleForErrorCode:(unint64_t)a3;
- (id)presentationSceneBundleIdentifierForPeerPaymentActionController:(id)a3;
- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4;
- (void)peerPaymentActionController:(id)a3 requestPresentViewController:(id)a4;
- (void)presentTopUpFlowForRecurringPayment:(id)a3;
- (void)thresholdTopUpDidSelectCancel:(id)a3;
- (void)thresholdTopUpDidSelectContinue:(id)a3 completion:(id)a4;
- (void)thresholdTopUpDidSelectUpdate:(id)a3 completion:(id)a4;
- (void)thresholdTopUpPerformCancel:(id)a3 completion:(id)a4;
@end

@implementation PKPeerPaymentThresholdTopUpController

- (PKPeerPaymentThresholdTopUpController)initWithPeerPaymentAccount:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentThresholdTopUpController;
  v15 = [(PKPeerPaymentThresholdTopUpController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pass, a4);
    v16->_context = a5;
    objc_storeStrong((id *)&v16->_account, a3);
    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (void)presentTopUpFlowForRecurringPayment:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F84E00], "sharedInstance", a3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke;
  v5[3] = &unk_1E59CB328;
  v5[4] = self;
  [v4 recurringPaymentsWithCompletion:v5];
}

void __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_2(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v84;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v84 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        if ([v9 type] == 3)
        {
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v9);
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v83 objects:v87 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v82 = 0;
  v10 = [*(id *)(*(void *)(a1 + 32) + 16) thresholdTopUpFeatureDescriptor];
  v11 = [v10 amountSuggestions];
  id v12 = [v10 thresholdSuggestions];
  if ([v11 count]) {
    BOOL v13 = [v12 count] == 0;
  }
  else {
    BOOL v13 = 1;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 16);
  id v81 = 0;
  BOOL v15 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:1 account:v14 unableReason:&v82 displayableError:&v81];
  id v16 = v81;
  uint64_t v17 = *(void *)(a1 + 32);
  objc_super v18 = *(void **)(v17 + 64);
  if (v18) {
    int v19 = 1;
  }
  else {
    int v19 = v15;
  }
  if (v19 != 1 || v13)
  {
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_4;
    v80[3] = &unk_1E59CA7D0;
    v80[4] = v17;
    v47 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v82 displayableError:v16 addCardActionHandler:v80];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained thresholdTopUpController:*(void *)(a1 + 32) requestsPresentViewController:v47];
  }
  else if (v18)
  {
    id v75 = v16;
    v76 = v10;
    v20 = [v18 fundingSource];
    uint64_t v21 = [v20 name];

    v78 = [PKThresholdTopUpSetupViewController alloc];
    v22 = [*(id *)(*(void *)(a1 + 32) + 64) amount];
    v23 = [*(id *)(*(void *)(a1 + 32) + 64) threshold];
    v24 = [*(id *)(*(void *)(a1 + 32) + 16) currentBalance];
    v25 = [v24 currency];
    v26 = [*(id *)(*(void *)(a1 + 32) + 64) fundingSource];
    v27 = [v26 fpanIdentifier];
    v28 = v78;
    v77 = v11;
    v79 = v12;
    v29 = v11;
    v30 = (void *)v21;
    v31 = [(PKThresholdTopUpSetupViewController *)v28 initWithAmountSuggestions:v29 selectedAmount:v22 thresholdSuggestions:v12 selectedThreshold:v23 currencyCode:v25 paymentMethodName:v21 paymentMethodIdentifier:v27 mode:1 viewStyle:0 delegate:*(void *)(a1 + 32)];

    objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), v31);
    v32 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadCrea.isa);
    [(PKThresholdTopUpSetupViewController *)v31 setTitle:v32];

    v33 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadAmou.isa);
    [(PKThresholdTopUpSetupViewController *)v31 setAmountTitle:v33];

    v34 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadThre.isa);
    [(PKThresholdTopUpSetupViewController *)v31 setThresholdTitle:v34];

    if (([*(id *)(*(void *)(a1 + 32) + 64) actions] & 2) != 0)
    {
      v35 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadCanc.isa);
      [(PKThresholdTopUpSetupViewController *)v31 setCancelTitle:v35];
    }
    v36 = v30;
    v10 = v76;
    if ([v30 length])
    {
      v37 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadPaym.isa);
      [(PKThresholdTopUpSetupViewController *)v31 setPaymentMethodTitle:v37];
    }
    v38 = [*(id *)(*(void *)(a1 + 32) + 64) lastExecutedTransaction];
    uint64_t v39 = [*(id *)(*(void *)(a1 + 32) + 64) status];
    v11 = v77;
    if (v38)
    {
      uint64_t v40 = v39;
      if ((unint64_t)(v39 - 3) <= 1 && [v38 status] == 3)
      {
        uint64_t v74 = [v38 errorCode];
        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
        v42 = objc_alloc_init(PKDashboardPassMessage);
        v43 = [v38 identifier];
        [(PKDashboardPassMessage *)v42 setIdentifier:v43];

        if (v40 == 4)
        {
          v44 = v41;
          v45 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadErro.isa);
          [(PKDashboardPassMessage *)v42 setTitle:v45];

          v46 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadErro_0.isa);
          [(PKDashboardPassMessage *)v42 setMessage:v46];

          [(PKThresholdTopUpSetupViewController *)v31 setEditingUnavailable:1];
        }
        else
        {
          v44 = v41;
          v59 = [*(id *)(a1 + 32) _titleForErrorCode:v74];
          [(PKDashboardPassMessage *)v42 setTitle:v59];

          v60 = [*(id *)(a1 + 32) _messageForErrorCode:v74];
          [(PKDashboardPassMessage *)v42 setMessage:v60];

          if ([v38 exceedsAppleCashLimits])
          {
            v61 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorLe.isa);
            [(PKDashboardPassMessage *)v42 setButtonTitle:v61];

            [(PKDashboardPassMessage *)v42 setActionOnButtonPress:&__block_literal_global_67];
          }
        }
        v62 = PKPassKitUIBundle();
        v63 = [v62 URLForResource:@"MessageAlert" withExtension:@"pdf"];

        double v64 = PKUIScreenScale();
        v65 = PKUIImageFromPDF(v63, 45.0, 45.0, v64);
        [(PKDashboardPassMessage *)v42 setImage:v65];
        [v44 addObject:v42];
        [(PKThresholdTopUpSetupViewController *)v31 setMessages:v44];
      }
    }
    v66 = [*(id *)(*(void *)(a1 + 32) + 16) loadFromCardFeatureDescriptor];
    id v67 = objc_alloc_init(MEMORY[0x1E4F84DF0]);
    v68 = [v66 merchantIdentifier];
    [v67 setMerchantIdentifier:v68];

    v69 = [v66 supportedNetworks];
    [v67 setSupportedNetworks:v69];

    objc_msgSend(v67, "setMerchantCapabilities:", objc_msgSend(v66, "merchantCapabilities"));
    v70 = (void *)MEMORY[0x1E4F1CAD0];
    v71 = [*(id *)(*(void *)(a1 + 32) + 16) countryCode];
    v72 = [v70 setWithObject:v71];
    [v67 setSupportedCountries:v72];

    [(PKThresholdTopUpSetupViewController *)v31 setPaymentRequest:v67];
    id v73 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v73 thresholdTopUpController:*(void *)(a1 + 32) requestsPushViewController:v31];

    id v12 = v79;
    id v16 = v75;
  }
  else
  {
    v49 = [PKThresholdTopUpSetupViewController alloc];
    v50 = [*(id *)(*(void *)(a1 + 32) + 16) currentBalance];
    v51 = [v50 currency];
    v52 = [(PKThresholdTopUpSetupViewController *)v49 initWithAmountSuggestions:v11 selectedAmount:0 thresholdSuggestions:v12 selectedThreshold:0 currencyCode:v51 paymentMethodName:0 paymentMethodIdentifier:0 mode:0 viewStyle:0 delegate:*(void *)(a1 + 32)];

    objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), v52);
    v53 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadCrea.isa);
    [(PKPaymentSetupOptionsViewController *)v52 setTitleText:v53];

    v54 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadCrea_0.isa);
    [(PKPaymentSetupOptionsViewController *)v52 setSubtitleText:v54];

    v55 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadAmou.isa);
    [(PKThresholdTopUpSetupViewController *)v52 setAmountTitle:v55];

    v56 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadThre.isa);
    [(PKThresholdTopUpSetupViewController *)v52 setThresholdTitle:v56];

    v57 = [[PKNavigationController alloc] initWithRootViewController:v52];
    if ([(UIViewController *)v52 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKNavigationController *)v57 setModalPresentationStyle:2];
    }
    id v58 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v58 thresholdTopUpController:*(void *)(a1 + 32) requestsPresentViewController:v57];
  }
}

void __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_3()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/en-us/HT207884"];
  [v1 openURL:v0 configuration:0 completionHandler:0];
}

uint64_t __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
}

- (id)_titleForErrorCode:(unint64_t)a3
{
  return (id)PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadErro_1.isa);
}

- (id)_messageForErrorCode:(unint64_t)a3
{
  id v3 = @"AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_CUMULATIVE_LIMIT";
  if (a3 - 40305 > 1) {
    id v3 = @"AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_PAYMENT_METHOD";
  }
  if (a3 - 40340 >= 4) {
    id v4 = v3;
  }
  else {
    id v4 = @"AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_FRAUD";
  }
  uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&v4->isa);

  return v5;
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  v8 = [MEMORY[0x1E4F84D50] sharedService];
  v9 = (void *)[v7 initWithWebService:v8];

  [v9 setAllowedPaymentNetworks:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v9 setAllowedFeatureIdentifiers:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E59CAEF8;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v11 preflightWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v11, a1 + 5);
  char v12 = a2;
  id v6 = a1[4];
  v11[1] = a1[6];
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      [v4 setPaymentSetupMode:*(void *)(a1 + 56)];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v10[3] = &unk_1E59CAEA8;
      v10[4] = v3;
      id v11 = v4;
      id v5 = v4;
      [v5 preflightWithCompletion:v10];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      v8 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:v7];
      id v9 = objc_loadWeakRetained(v3 + 1);
      [v9 thresholdTopUpController:v3 requestsPresentViewController:v8];
    }
  }
}

void __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained thresholdTopUpController:*(void *)(a1 + 32) requestsPresentViewController:*(void *)(a1 + 40)];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:0];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];

  return v5;
}

- (void)paymentSetupDidFinish:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained thresholdTopUpController:self requestsDismissViewController:v5];
}

- (void)thresholdTopUpDidSelectCancel:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained thresholdTopUpController:self requestsDismissViewController:v5];
}

- (void)thresholdTopUpPerformCancel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKPeerPaymentRecurringPayment *)self->_existingTopUp identifier];
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling threshold top up", buf, 2u);
  }

  id v10 = [MEMORY[0x1E4F84E10] sharedService];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  id v14[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke;
  v14[3] = &unk_1E59D2238;
  id v15 = v8;
  id v16 = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  [v10 peerPaymentRecurringPaymentPerformAction:2 identifier:v13 completion:v14];
}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_3;
    v15[3] = &unk_1E59CE110;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 40);
    id v16 = v8;
    uint64_t v17 = v9;
    id v18 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], v15);

    id v10 = v16;
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Deleting threshold top up from database", buf, 2u);
    }

    id v12 = [MEMORY[0x1E4F84E00] sharedInstance];
    v23[0] = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_76;
    v19[3] = &unk_1E59CE110;
    uint64_t v14 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v14;
    id v21 = *(id *)(a1 + 56);
    [v12 deleteRecurringPaymentsForIdentifiers:v13 completion:v19];

    id v10 = v20;
  }
}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_76(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  if (objc_opt_respondsToSelector())
  {
    id v2 = objc_loadWeakRetained((id *)(a1[4] + 8));
    [v2 thresholdTopUpController:a1[4] requestsPopViewController:a1[5]];
  }
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_3(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling threshold top up failed with error %@", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F84D80] displayableErrorForError:a1[4]];
  id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, &__block_literal_global_82, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  [WeakRetained thresholdTopUpController:a1[5] requestsPresentViewController:v5];

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

- (void)thresholdTopUpDidSelectContinue:(id)a3 completion:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_actionCompletedBlock)
  {
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
  else
  {
    int v8 = _Block_copy(v6);
    id actionCompletedBlock = self->_actionCompletedBlock;
    self->_id actionCompletedBlock = v8;

    uint64_t v10 = [MEMORY[0x1E4F84E10] sharedService];
    id v11 = [[PKPeerPaymentActionController alloc] initWithPaymentPass:self->_pass webService:v10 context:self->_context passLibraryDataProvider:self->_passLibraryDataProvider delegate:self];
    controller = self->_controller;
    self->_controller = v11;

    [(PKPeerPaymentActionController *)self->_controller setControllerAction:1];
    id v13 = [(PKPeerPaymentAccount *)self->_account currentBalance];
    uint64_t v14 = [v13 currency];

    id v15 = self->_controller;
    p_vc = &self->_vc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
    id v18 = [WeakRetained currentThreshold];
    int v19 = PKCurrencyAmountMake();
    [(PKPeerPaymentActionController *)v15 setThresholdAmount:v19];

    id v20 = self->_controller;
    id v21 = objc_loadWeakRetained((id *)p_vc);
    v22 = [v21 currentAmount];
    v23 = PKCurrencyAmountMake();
    [(PKPeerPaymentActionController *)v20 performActionWithCurrencyAmount:v23];
  }
}

- (void)thresholdTopUpDidSelectUpdate:(id)a3 completion:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_actionCompletedBlock)
  {
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
  else
  {
    int v8 = _Block_copy(v6);
    id actionCompletedBlock = self->_actionCompletedBlock;
    self->_id actionCompletedBlock = v8;

    uint64_t v10 = [MEMORY[0x1E4F84E10] sharedService];
    id v11 = [[PKPeerPaymentActionController alloc] initWithPaymentPass:self->_pass webService:v10 context:self->_context passLibraryDataProvider:self->_passLibraryDataProvider delegate:self];
    controller = self->_controller;
    self->_controller = v11;

    [(PKPeerPaymentActionController *)self->_controller setControllerAction:1];
    id v13 = [(PKPeerPaymentAccount *)self->_account currentBalance];
    uint64_t v14 = [v13 currency];

    id v15 = self->_controller;
    id v16 = [(PKPeerPaymentRecurringPayment *)self->_existingTopUp identifier];
    [(PKPeerPaymentActionController *)v15 setRecurringPaymentIdentifier:v16];

    uint64_t v17 = self->_controller;
    p_vc = &self->_vc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
    id v20 = [WeakRetained currentThreshold];
    id v21 = PKCurrencyAmountMake();
    [(PKPeerPaymentActionController *)v17 setThresholdAmount:v21];

    v22 = self->_controller;
    id v23 = objc_loadWeakRetained((id *)&self->_vc);
    id v24 = [v23 selectedPass];
    [(PKPeerPaymentActionController *)v22 setAlternateFundingSource:v24];

    v25 = self->_controller;
    id v26 = objc_loadWeakRetained((id *)p_vc);
    v27 = [v26 currentAmount];
    v28 = PKCurrencyAmountMake();
    [(PKPeerPaymentActionController *)v25 performActionWithCurrencyAmount:v28];
  }
}

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v12 = [MEMORY[0x1E4F84E00] sharedInstance];
    id v13 = [(PKPeerPaymentAccount *)self->_account currentBalance];
    uint64_t v10 = [v13 currency];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
    id v15 = [WeakRetained currentAmount];
    id v16 = PKCurrencyAmountMake();

    id v17 = objc_loadWeakRetained((id *)&self->_vc);
    id v18 = [v17 currentThreshold];
    int v19 = PKCurrencyAmountMake();

    id v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Updating local threshold top up", buf, 2u);
    }

    id v21 = [v6 recurringPaymentIdentifier];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke;
    v25[3] = &unk_1E59D2280;
    v25[4] = self;
    id v26 = v16;
    id v27 = v19;
    id v28 = v12;
    id v22 = v12;
    id v23 = v19;
    id v24 = v16;
    [v22 updateAutoReloadAmount:v24 threshold:v23 identifier:v21 completion:v25];

    goto LABEL_10;
  }
  id actionCompletedBlock = (void (**)(id, void))self->_actionCompletedBlock;
  if (actionCompletedBlock)
  {
    actionCompletedBlock[2](actionCompletedBlock, 0);
    id v8 = self->_actionCompletedBlock;
    self->_id actionCompletedBlock = 0;
  }
  if (a4 - 3 <= 1)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_vc);
    uint64_t v10 = [v9 navigationController];

    id v11 = [v10 presentedViewController];

    if (v11) {
      [v10 dismissViewControllerAnimated:1 completion:0];
    }
LABEL_10:
  }
}

void __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke_2;
  v3[3] = &unk_1E59CB8B0;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke_2(id *a1)
{
  id v2 = a1[4];
  uint64_t v3 = *((void *)v2 + 9);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    id v4 = a1[4];
    id v5 = (void *)v4[9];
    v4[9] = 0;

    id v2 = a1[4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)v2 + 3);
  uint64_t v7 = [WeakRetained mode];

  if (!v7)
  {
    id v8 = [[PKExplanationViewController alloc] initWithContext:*((void *)a1[4] + 4)];
    [(PKExplanationViewController *)v8 setShowCancelButton:0];
    id v9 = [(PKExplanationViewController *)v8 navigationItem];
    [v9 setHidesBackButton:1];

    uint64_t v10 = [(PKExplanationViewController *)v8 explanationView];
    [v10 setShowPrivacyView:0];
    [v10 setDelegate:a1[4]];
    id v11 = [a1[4] _setupCompleteImage];
    [v10 setImage:v11];

    id v12 = [v10 imageView];
    [v12 _setCornerRadius:14.0];

    id v13 = [a1[5] minimalFormattedStringValue];
    uint64_t v14 = [a1[6] minimalFormattedStringValue];
    id v15 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadSetu_1.isa, &stru_1EF1B5770.isa, v13, v14);
    [v10 setBodyText:v15];

    [v10 setShowCheckmark:1];
    id v16 = [v10 dockView];
    id v17 = [v16 primaryButton];
    id v18 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadSetu_2.isa);
    [v17 setTitle:v18 forState:0];

    int v19 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadSetu_3.isa);
    [v10 setTitleText:v19];

    id v20 = objc_loadWeakRetained((id *)a1[4] + 3);
    id v21 = [v20 navigationController];
    [v21 pushViewController:v8 animated:1];
  }
  id v22 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Updating recurring peer payments following successful setup", buf, 2u);
  }

  return [a1[7] updateRecurringPaymentsWithCompletion:&__block_literal_global_100];
}

void __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke_97()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Updated recurring peer payments after successful setup", v1, 2u);
  }
}

- (id)_setupCompleteImage
{
  id v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:60.0];
  uint64_t v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"dollarsign.arrow.circlepath" withConfiguration:v2];
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  id v5 = [v3 imageWithTintColor:v4];

  id v6 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v7 = PKUIImageWithBackground(v5, v6, 80.0, 80.0);

  return v7;
}

- (void)peerPaymentActionController:(id)a3 requestPresentViewController:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
  id v6 = [WeakRetained navigationController];

  if (v6)
  {
    [v6 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 thresholdTopUpController:self requestsPresentViewController:v8];
  }
}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained presentationSceneIdentifierForTopUpController:self];

  return v5;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentActionController:(id)a3
{
  return 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained thresholdTopUpControllerCompletedSetup:self];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionCompletedBlock, 0);
  objc_storeStrong((id *)&self->_existingTopUp, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_vc);
  objc_storeStrong((id *)&self->_account, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end