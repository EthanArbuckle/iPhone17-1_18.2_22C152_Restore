@interface PKPeerPaymentActionController
+ (BOOL)canPerformPeerPaymentAction:(unint64_t)a3 account:(id)a4;
+ (BOOL)canPerformPeerPaymentAction:(unint64_t)a3 account:(id)a4 unableReason:(unint64_t *)a5 displayableError:(id *)a6;
+ (id)alertControllerForPeerPaymentActionUnableReason:(unint64_t)a3 displayableError:(id)a4 addCardActionHandler:(id)a5;
+ (id)displayableErrorForPeerPaymentAction:(unint64_t)a3 andReason:(unint64_t)a4;
- (NSString)recurringPaymentIdentifier;
- (PKBankAccountInformation)bankInformation;
- (PKCurrencyAmount)thresholdAmount;
- (PKPaymentPass)alternateFundingSource;
- (PKPeerPaymentActionController)initWithPaymentPass:(id)a3 webService:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7;
- (PKPeerPaymentActionControllerDelegate)delegate;
- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3;
- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3;
- (unint64_t)_peerPaymentControllerModeForAction;
- (unint64_t)controllerAction;
- (void)_handleError:(id)a3;
- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3;
- (void)_peerPaymentActionHasCompletedWithState:(unint64_t)a3;
- (void)_presentIdentityVerificationWithError:(id)a3;
- (void)_presentTermsAndConditionsWithError:(id)a3;
- (void)_updateAccountWithCompletion:(id)a3;
- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)performActionWithCurrencyAmount:(id)a3;
- (void)presentAddBankAccountViewController;
- (void)presentAddDebitCardViewController;
- (void)setAlternateFundingSource:(id)a3;
- (void)setControllerAction:(unint64_t)a3;
- (void)setRecurringPaymentIdentifier:(id)a3;
- (void)setThresholdAmount:(id)a3;
- (void)viewControllerDidCancelSetupFlow:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation PKPeerPaymentActionController

+ (BOOL)canPerformPeerPaymentAction:(unint64_t)a3 account:(id)a4
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  return +[PKPeerPaymentActionController canPerformPeerPaymentAction:a3 account:a4 unableReason:&v6 displayableError:&v5];
}

+ (BOOL)canPerformPeerPaymentAction:(unint64_t)a3 account:(id)a4 unableReason:(unint64_t *)a5 displayableError:(id *)a6
{
  id v10 = a4;
  v11 = v10;
  if (a3 == 3)
  {
    if (![v10 supportsRecurringPayments]) {
      goto LABEL_14;
    }
    v23 = [v11 recurringPaymentsFeatureDescriptor];
    id v24 = objc_alloc_init(MEMORY[0x1E4F84DF0]);
    v25 = [v23 merchantIdentifier];
    [v24 setMerchantIdentifier:v25];

    v26 = [v23 supportedNetworks];
    [v24 setSupportedNetworks:v26];

    objc_msgSend(v24, "setMerchantCapabilities:", objc_msgSend(v23, "merchantCapabilities"));
    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v28 = [v11 countryCode];
    v29 = [v27 setWithObject:v28];
    [v24 setSupportedCountries:v29];

    v30 = [MEMORY[0x1E4F84898] sharedInstance];
    v31 = [v30 _defaultPaymentPassForPaymentRequest:v24];
    BOOL v21 = v31 != 0;
    unint64_t v22 = 4 * (v31 == 0);

    if (!a5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (a3 == 2)
  {
    if (([v10 supportsTransferToBank] & 1) == 0
      && ![v11 supportsInstantWithdrawal])
    {
      goto LABEL_14;
    }
    unint64_t v22 = 0;
    BOOL v21 = 1;
    if (!a5) {
      goto LABEL_18;
    }
LABEL_17:
    *a5 = v22;
    goto LABEL_18;
  }
  if (a3 != 1)
  {
    unint64_t v22 = 0;
    BOOL v21 = 0;
    if (!a5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ([v10 supportsLoadFromCard])
  {
    v12 = [v11 loadFromCardFeatureDescriptor];
    id v13 = objc_alloc_init(MEMORY[0x1E4F84DF0]);
    v14 = [v12 merchantIdentifier];
    [v13 setMerchantIdentifier:v14];

    v15 = [v12 supportedNetworks];
    [v13 setSupportedNetworks:v15];

    objc_msgSend(v13, "setMerchantCapabilities:", objc_msgSend(v12, "merchantCapabilities"));
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v17 = [v11 countryCode];
    v18 = [v16 setWithObject:v17];
    [v13 setSupportedCountries:v18];

    v19 = [MEMORY[0x1E4F84898] sharedInstance];
    v20 = [v19 _defaultPaymentPassForPaymentRequest:v13];
    BOOL v21 = v20 != 0;
    v33 = v12;
    if (v20)
    {
      unint64_t v22 = 0;
    }
    else if (([v12 merchantCapabilities] & 8) != 0)
    {
      if (([v12 merchantCapabilities] & 4) != 0) {
        unint64_t v22 = 3;
      }
      else {
        unint64_t v22 = 4;
      }
    }
    else
    {
      unint64_t v22 = 3;
    }

    if (!a5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_14:
  BOOL v21 = 0;
  unint64_t v22 = 2;
  if (a5) {
    goto LABEL_17;
  }
LABEL_18:
  if (a6)
  {
    *a6 = [a1 displayableErrorForPeerPaymentAction:a3 andReason:v22];
  }

  return v21;
}

+ (id)displayableErrorForPeerPaymentAction:(unint64_t)a3 andReason:(unint64_t)a4
{
  uint64_t v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_4.isa);
  switch(a4)
  {
    case 4uLL:
      if (a3 == 3)
      {
        uint64_t v8 = PKLocalizedPeerPaymentRecurringString(&cfstr_SetupNoDebitCa.isa);

        uint64_t v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_SetupNoDebitCa_0.isa);
        goto LABEL_14;
      }
      if (a3 != 1) {
        goto LABEL_11;
      }
      uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_8.isa);

      v9 = @"PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_DEBIT_PAYMENT_CARDS_AVAILABLE_DESCRIPTION";
      break;
    case 3uLL:
      if (a3 != 1) {
        goto LABEL_11;
      }
      uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_6.isa);

      v9 = @"PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_PAYMENT_CARDS_AVAILABLE_DESCRIPTION";
      break;
    case 2uLL:
LABEL_11:
      v7 = @"PEER_PAYMENT_ACTION_UNAVAILABLE_FEATURE_NOT_SUPPORTED_DESCRIPTION";
      goto LABEL_12;
    default:
      v7 = @"PEER_PAYMENT_ACTION_UNAVAILABLE_GENERIC_DESCRIPTION";
LABEL_12:
      v11 = PKLocalizedPeerPaymentString(&v7->isa);
      goto LABEL_15;
  }
  uint64_t v10 = PKLocalizedPeerPaymentString(&v9->isa);
LABEL_14:
  v11 = (void *)v10;
  uint64_t v6 = (void *)v8;
LABEL_15:
  v12 = PKDisplayableErrorCustom();

  return v12;
}

+ (id)alertControllerForPeerPaymentActionUnableReason:(unint64_t)a3 displayableError:(id)a4 addCardActionHandler:(id)a5
{
  id v7 = a5;
  if (a4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB1418];
    id v9 = a4;
    uint64_t v10 = PKTitleForDisplayableError();
    v11 = MEMORY[0x1A6221F20](v9);

    a4 = [v8 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

    v12 = (void *)MEMORY[0x1E4FB1410];
    id v13 = PKLocalizedString(&cfstr_CancelButtonTi.isa);
    v14 = [v12 actionWithTitle:v13 style:1 handler:0];

    [a4 addAction:v14];
    if (a3 - 3 <= 1 && v7)
    {
      v15 = (void *)MEMORY[0x1E4FB1410];
      v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_11.isa);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __119__PKPeerPaymentActionController_alertControllerForPeerPaymentActionUnableReason_displayableError_addCardActionHandler___block_invoke;
      v19[3] = &unk_1E59CB150;
      id v20 = v7;
      v17 = [v15 actionWithTitle:v16 style:0 handler:v19];

      [a4 addAction:v17];
      [a4 setPreferredAction:v17];
    }
  }

  return a4;
}

uint64_t __119__PKPeerPaymentActionController_alertControllerForPeerPaymentActionUnableReason_displayableError_addCardActionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PKPeerPaymentActionController)initWithPaymentPass:(id)a3 webService:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentActionController;
  v17 = [(PKPeerPaymentActionController *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pass, a3);
    objc_storeStrong((id *)&v18->_peerPaymentWebService, a4);
    v18->_context = a5;
    objc_storeWeak((id *)&v18->_delegate, v16);
    v18->_controllerAction = 0;
    v19 = [(PKPeerPaymentWebService *)v18->_peerPaymentWebService targetDevice];
    uint64_t v20 = [v19 account];
    account = v18->_account;
    v18->_account = (PKPeerPaymentAccount *)v20;

    unint64_t v22 = (PKBankAccountInformation *)objc_alloc_init(MEMORY[0x1E4F84550]);
    bankInformation = v18->_bankInformation;
    v18->_bankInformation = v22;

    objc_storeStrong((id *)&v18->_passLibraryDataProvider, a6);
    id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v25 = *MEMORY[0x1E4F87CC8];
    v26 = [(PKPeerPaymentWebService *)v18->_peerPaymentWebService targetDevice];
    [v24 addObserver:v18 selector:sel__handlePeerPaymentAccountDidChangeNotification_ name:v25 object:v26];
  }
  return v18;
}

- (void)performActionWithCurrencyAmount:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke;
  aBlock[3] = &unk_1E59DE040;
  aBlock[4] = self;
  id v5 = v4;
  id v22 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  if (self->_performingAction)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[PKPeerPaymentActionController performActionWithCurrencyAmount:]";
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", buf, 0xCu);
    }

    [(PKPeerPaymentActionController *)self _peerPaymentActionHasCompletedWithState:2];
    goto LABEL_14;
  }
  if (!self->_peerPaymentController)
  {
    uint64_t v8 = (PKPeerPaymentController *)[objc_alloc(MEMORY[0x1E4F84D80]) initWithPeerPaymentWebService:self->_peerPaymentWebService];
    peerPaymentController = self->_peerPaymentController;
    self->_peerPaymentController = v8;

    [(PKPeerPaymentController *)self->_peerPaymentController setDelegate:self];
  }
  unint64_t controllerAction = self->_controllerAction;
  switch(controllerAction)
  {
    case 3uLL:
      [(PKBankAccountInformation *)self->_bankInformation updateToLatestKeychainData];
      v11 = self->_peerPaymentController;
      v12 = [(PKBankAccountInformation *)self->_bankInformation routingNumber];
      id v13 = [(PKBankAccountInformation *)self->_bankInformation accountNumber];
      id v14 = [(PKBankAccountInformation *)self->_bankInformation bankName];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_70;
      v19[3] = &unk_1E59D5628;
      void v19[4] = self;
      id v20 = v6;
      [(PKPeerPaymentController *)v11 identifyRecipientWithRoutingNumber:v12 accountNumber:v13 accountName:v14 completion:v19];

      id v15 = v20;
LABEL_13:

      break;
    case 2uLL:
      id v16 = self->_peerPaymentController;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3_73;
      v17[3] = &unk_1E59D5628;
      v17[4] = self;
      id v18 = v6;
      [(PKPeerPaymentController *)v16 identifyRecipientDebitCardWithCompletion:v17];
      id v15 = v18;
      goto LABEL_13;
    case 1uLL:
      [(PKPeerPaymentController *)self->_peerPaymentController identifyRecipientSelf];
      (*((void (**)(void *, PKPeerPaymentController *))v6 + 2))(v6, self->_peerPaymentController);
      break;
  }
LABEL_14:
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "selectMode:", objc_msgSend(*(id *)(a1 + 32), "_peerPaymentControllerModeForAction"));
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(v4 + 104);
  uint64_t v6 = *(void *)(v4 + 112);
  uint64_t v8 = [*(id *)(v4 + 96) amount];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2;
  v11[3] = &unk_1E59DE018;
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v9;
  id v10 = v3;
  [v10 quoteWithAmount:v5 source:3 requestToken:0 alternateFundingSource:v6 preserveCurrentBalance:0 recurringPaymentIdentifier:v7 frequency:0 startDate:0 threshold:v8 completion:v11];
}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3;
    v7[3] = &unk_1E59DDFF0;
    uint64_t v4 = *(void **)(a1 + 32);
    v7[4] = *(void *)(a1 + 40);
    return [v4 performQuote:a3 completion:v7];
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 40);
    return [v6 _handleError:a4];
  }
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4;
  v11[3] = &unk_1E59CDC58;
  char v14 = a2;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = *(void **)(a1 + 32);
    if (!v2[13])
    {
      uint64_t v3 = [*(id *)(a1 + 40) recurringPaymentIdentifier];
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 104);
      *(void *)(v4 + 104) = v3;

      v2 = *(void **)(a1 + 32);
    }
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    if (v7)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_5;
      v10[3] = &unk_1E59CA7D0;
      v10[4] = *(void *)(a1 + 32);
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, v10, 0);
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      [WeakRetained peerPaymentActionController:*(void *)(a1 + 32) requestPresentViewController:v8];

      return;
    }
    v2 = *(void **)(a1 + 32);
    uint64_t v6 = 2;
  }

  [v2 _peerPaymentActionHasCompletedWithState:v6];
}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _peerPaymentActionHasCompletedWithState:2];
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_70(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2_71;
  v8[3] = &unk_1E59DAA60;
  uint64_t v11 = a2;
  id v6 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  v8[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2_71(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 1) {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 56));
  }
  else {
    return [*(id *)(a1 + 32) _handleError:*(void *)(a1 + 40)];
  }
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3_73(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4_74;
  v8[3] = &unk_1E59DAA60;
  uint64_t v11 = a2;
  id v6 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  v8[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4_74(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 1) {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 56));
  }
  else {
    return [*(id *)(a1 + 32) _handleError:*(void *)(a1 + 40)];
  }
}

- (void)_peerPaymentActionHasCompletedWithState:(unint64_t)a3
{
  self->_performingAction = 0;
  if (a3 == 2) {
    [(PKPeerPaymentController *)self->_peerPaymentController reset];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained peerPaymentActionController:self hasChangedState:a3];
}

- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3
{
  [(PKBankAccountInformation *)self->_bankInformation updateToLatestKeychainData];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained peerPaymentActionController:self hasChangedState:5];
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
}

- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [WeakRetained presentationSceneIdentifierForPeerPaymentActionController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [WeakRetained presentationSceneBundleIdentifierForPeerPaymentActionController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKPeerPaymentActionController__handleError___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __46__PKPeerPaymentActionController__handleError___block_invoke(uint64_t a1)
{
  switch([MEMORY[0x1E4F84D80] proposedResolutionForError:*(void *)(a1 + 32)])
  {
    case 0:
      goto LABEL_9;
    case 1:
      if (*(void *)(a1 + 32))
      {
        v2 = objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
        uint64_t v3 = [v2 userInfo];
        id v4 = [v3 objectForKey:*MEMORY[0x1E4F28A50]];

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_2;
        aBlock[3] = &unk_1E59CA7D0;
        aBlock[4] = *(void *)(a1 + 40);
        id v5 = _Block_copy(aBlock);
        id v6 = [v4 domain];
        int v7 = [v6 isEqualToString:*MEMORY[0x1E4F87CD8]];

        if (v7)
        {
          if (![v4 code])
          {
            unint64_t v16 = *(void *)(*(void *)(a1 + 40) + 72) - 1;
            if (v16 > 2)
            {
              v19 = 0;
              id v18 = 0;
            }
            else
            {
              v17 = off_1E59DE0A0[v16];
              id v18 = PKLocalizedPeerPaymentString(&off_1E59DE088[v16]->isa);
              v19 = PKLocalizedPeerPaymentString(&v17->isa);
            }
            uint64_t v20 = PKDisplayableErrorCustom();

            goto LABEL_32;
          }
          if ([v4 code] == 40301)
          {
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 72);
            if (v8 == 3)
            {
              id v9 = @"PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_BANK_ERROR_DESCRIPTION";
              id v10 = @"PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_BANK_ERROR_TITLE";
            }
            else
            {
              if (v8 != 2)
              {
                v19 = 0;
                id v18 = 0;
                goto LABEL_31;
              }
              id v9 = @"PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_DEBIT_CARD_ERROR_DESCRIPTION";
              id v10 = @"PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_DEBIT_CARD_ERROR_TITLE";
            }
            id v18 = PKLocalizedPeerPaymentString(&v10->isa);
            v19 = PKLocalizedPeerPaymentString(&v9->isa);
LABEL_31:
            uint64_t v20 = PKDisplayableErrorCustom();

            [*(id *)(a1 + 40) _updateAccountWithCompletion:0];
LABEL_32:
            v2 = (void *)v20;
            goto LABEL_33;
          }
          if ([v4 code] == 40317)
          {
            if (*(void *)(*(void *)(a1 + 40) + 72) == 3)
            {
              id v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv_1.isa);
              v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv_2.isa);
            }
            else
            {
              v19 = 0;
              id v18 = 0;
            }
            id v21 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v18 message:v19 preferredStyle:1];
            v29 = (void *)MEMORY[0x1E4FB1410];
            v30 = PKLocalizedString(&cfstr_Cancel.isa);
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_3;
            v37[3] = &unk_1E59CB150;
            v32 = &v38;
            id v38 = v5;
            id v24 = [v29 actionWithTitle:v30 style:1 handler:v37];

            uint64_t v25 = (void *)MEMORY[0x1E4FB1410];
            v26 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv_3.isa);
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_4;
            v36[3] = &unk_1E59CB1F0;
            v36[4] = *(void *)(a1 + 40);
            v27 = v36;
LABEL_37:
            v31 = [v25 actionWithTitle:v26 style:0 handler:v27];

            [v21 addAction:v24];
            [v21 addAction:v31];
            [v21 setPreferredAction:v31];

            if (v21) {
              goto LABEL_34;
            }
            goto LABEL_33;
          }
          if ([v4 code] == 40318)
          {
            id v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_12.isa);
            v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_13.isa);
            id v21 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v18 message:v19 preferredStyle:1];
            id v22 = (void *)MEMORY[0x1E4FB1410];
            v23 = PKLocalizedString(&cfstr_Cancel.isa);
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_5;
            v34[3] = &unk_1E59CB150;
            v32 = &v35;
            id v35 = v5;
            id v24 = [v22 actionWithTitle:v23 style:1 handler:v34];

            uint64_t v25 = (void *)MEMORY[0x1E4FB1410];
            v26 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_11.isa);
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_6;
            v33[3] = &unk_1E59CB1F0;
            v33[4] = *(void *)(a1 + 40);
            v27 = v33;
            goto LABEL_37;
          }
        }
        id v18 = 0;
        v19 = 0;
LABEL_33:
        id v21 = PKAlertForDisplayableErrorWithHandlers(v2, 0, v5, 0);
LABEL_34:
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
        [WeakRetained peerPaymentActionController:*(void *)(a1 + 40) requestPresentViewController:v21];

        return;
      }
LABEL_9:
      uint64_t v11 = *(void **)(a1 + 40);
      [v11 _peerPaymentActionHasCompletedWithState:2];
      return;
    case 2:
      uint64_t v13 = *(void *)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      [v12 _presentTermsAndConditionsWithError:v13];
      return;
    case 3:
      uint64_t v15 = *(void *)(a1 + 32);
      char v14 = *(void **)(a1 + 40);
      [v14 _presentIdentityVerificationWithError:v15];
      return;
    default:
      return;
  }
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _peerPaymentActionHasCompletedWithState:2];
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAddBankAccountViewController];
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAddDebitCardViewController];
}

- (void)_presentIdentityVerificationWithError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F871A0]];

  if (v6)
  {
    int v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v4 = (id)v8;
  }
  char v9 = PKDeviceSupportsPeerPaymentIdentityVerification();
  id v10 = [v4 userInfo];
  uint64_t v11 = [v10 objectForKey:*MEMORY[0x1E4F87450]];

  if ((v9 & 1) == 0)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke;
    v25[3] = &unk_1E59CA7D0;
    v25[4] = self;
    PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v25);
    char v14 = (PKPeerPaymentIdentityVerificationController *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained peerPaymentActionController:self requestPresentViewController:v14];
LABEL_12:

    goto LABEL_13;
  }
  id v12 = PKLogFacilityTypeGetObject();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Presenting identity verification flow.", buf, 2u);
    }

    char v14 = [[PKPeerPaymentIdentityVerificationController alloc] initWithPeerPaymentWebService:self->_peerPaymentWebService identityVerificationResponse:v11 setupDelegate:self hideInitialSplashScreen:0 context:self->_context];
    id WeakRetained = [(PKPeerPaymentIdentityVerificationController *)v14 firstViewController];
    if (WeakRetained)
    {
      unint64_t v16 = [[PKNavigationController alloc] initWithRootViewController:WeakRetained];
      [(PKNavigationController *)v16 setSupportedInterfaceOrientations:2];
      [(PKNavigationController *)v16 setModalInPresentation:1];
      if (objc_msgSend(WeakRetained, "pkui_userInterfaceIdiomSupportsLargeLayouts")) {
        [(PKNavigationController *)v16 setModalPresentationStyle:2];
      }
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 peerPaymentActionController:self requestPresentViewController:v16];
    }
    goto LABEL_12;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Cannot present identity verification flow because the response data is nil", buf, 2u);
  }

  id v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen.isa);
  v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen_0.isa);
  uint64_t v20 = PKDisplayableErrorCustom();

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke_135;
  v23[3] = &unk_1E59CA7D0;
  v23[4] = self;
  id v21 = PKAlertForDisplayableErrorWithHandlers(v20, 0, v23, 0);
  id v22 = objc_loadWeakRetained((id *)&self->_delegate);
  [v22 peerPaymentActionController:self requestPresentViewController:v21];

  id v4 = v20;
LABEL_13:
}

uint64_t __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _peerPaymentActionHasCompletedWithState:2];
}

uint64_t __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) _peerPaymentActionHasCompletedWithState:2];
}

- (void)_presentTermsAndConditionsWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(PKPeerPaymentActionController *)self _updateAccountWithCompletion:v6];
}

void __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F871A0]];

  if (v4)
  {
    id v5 = [v2 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v2 = (id)v6;
  }
  id v7 = [v2 userInfo];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F87EF8]];

  char v9 = [v8 termsURL];
  uint64_t v10 = [v8 termsIdentifier];
  uint64_t v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 24) termsURL];

  char v9 = [*(id *)(*(void *)(a1 + 40) + 24) termsIdentifier];

  if (v13)
  {
    if (v9)
    {
      uint64_t v11 = v9;
      char v9 = (void *)v13;
LABEL_11:
      char v14 = [*(id *)(*(void *)(a1 + 40) + 24) associatedPassUniqueID];
      uint64_t v15 = [[PKPeerPaymentTermsController alloc] initWithTermsURL:v9 termsIdentifier:v11 passUniqueID:v14 webService:*(void *)(*(void *)(a1 + 40) + 16)];
      unint64_t v16 = *(void **)(*(void *)(a1 + 40) + 40);
      *(void *)(*(void *)(a1 + 40) + 40) = v15;

      objc_initWeak(location, *(id *)(a1 + 40));
      id v17 = *(void **)(*(void *)(a1 + 40) + 40);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_2;
      v35[3] = &unk_1E59DE068;
      objc_copyWeak(&v36, location);
      [v17 setCustomPresentationHandler:v35];
      id v18 = *(void **)(*(void *)(a1 + 40) + 40);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_3;
      v33[3] = &unk_1E59CC670;
      objc_copyWeak(&v34, location);
      [v18 presentTermsOverController:0 showInterstitialViewController:1 withCompletionHandler:v33];
      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      objc_destroyWeak(location);

      goto LABEL_18;
    }
    v26 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(void **)(*(void *)(a1 + 40) + 24);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v27;
      _os_log_impl(&dword_19F450000, v26, OS_LOG_TYPE_DEFAULT, "Error: Cannot present terms with a nil terms identifier for account %@", (uint8_t *)location, 0xCu);
    }

    uint64_t v29 = *(void *)(a1 + 40);
    objc_super v28 = (void *)(a1 + 40);
    v30 = (void *)*(v28 - 1);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_137;
    v37[3] = &unk_1E59CA7D0;
    void v37[4] = v29;
    id v31 = PKAlertForDisplayableErrorWithHandlers(v30, 0, v37, 0);
    id WeakRetained = objc_loadWeakRetained((id *)(*v28 + 80));
    [WeakRetained peerPaymentActionController:*v28 requestPresentViewController:v31];

    char v9 = (void *)v13;
  }
  else
  {
    v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void **)(*(void *)(a1 + 40) + 24);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v20;
      _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Error: Cannot present a nil terms URL for account %@", (uint8_t *)location, 0xCu);
    }

    uint64_t v22 = *(void *)(a1 + 40);
    id v21 = (void *)(a1 + 40);
    v23 = (void *)*(v21 - 1);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_136;
    v38[3] = &unk_1E59CA7D0;
    v38[4] = v22;
    id v24 = PKAlertForDisplayableErrorWithHandlers(v23, 0, v38, 0);
    id v25 = objc_loadWeakRetained((id *)(*v21 + 80));
    [v25 peerPaymentActionController:*v21 requestPresentViewController:v24];
  }
LABEL_18:
}

uint64_t __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_136(uint64_t a1)
{
  return [*(id *)(a1 + 32) _peerPaymentActionHasCompletedWithState:2];
}

uint64_t __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_137(uint64_t a1)
{
  return [*(id *)(a1 + 32) _peerPaymentActionHasCompletedWithState:2];
}

void __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 10);
    [v6 peerPaymentActionController:v5 requestPresentViewController:v7];
  }
}

void __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _peerPaymentActionHasCompletedWithState:1];
    id WeakRetained = v2;
  }
}

- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPeerPaymentActionController__handlePeerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PKPeerPaymentActionController__handlePeerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) targetDevice];
  uint64_t v2 = [v5 account];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (unint64_t)_peerPaymentControllerModeForAction
{
  unint64_t v2 = self->_controllerAction - 1;
  if (v2 > 2) {
    return 0;
  }
  else {
    return qword_1A0445678[v2];
  }
}

- (void)_updateAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService peerPaymentService];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke;
  v7[3] = &unk_1E59CE988;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 updateAccountWithCompletion:v7];
}

void __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)presentAddBankAccountViewController
{
  id v6 = [(PKPeerPaymentAccount *)self->_account countryCode];
  id v3 = [[PKAddBankAccountInformationViewController alloc] initWithDelegate:self bankInformation:self->_bankInformation accountCountryCode:v6];
  id v4 = [[PKNavigationController alloc] initWithRootViewController:v3];
  [(PKNavigationController *)v4 setModalInPresentation:1];
  [(PKNavigationController *)v4 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)v3 pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v4 setModalPresentationStyle:2];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained peerPaymentActionController:self requestPresentViewController:v4];
}

- (void)presentAddDebitCardViewController
{
  id v3 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v4 = [MEMORY[0x1E4F84D50] sharedService];
  id v20 = (id)[v3 initWithWebService:v4];

  id v5 = objc_alloc_init(PKNavigationController);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84D90]) initWithPeerPaymentAccount:self->_account];
  id v7 = [[PKPeerPaymentSetupFlowProvisionConfiguration alloc] initWithSetupDelegate:self];
  id v8 = [[PKPeerPaymentSetupFlowController alloc] initWithPeerPaymentCredential:v6 provisioningController:v20 passLibraryDataProvider:self->_passLibraryDataProvider configuration:v7 context:self->_context];
  char v9 = [[PKPaymentAddDebitCardViewController alloc] initWithPeerPaymentSetupFlowController:v8];
  [(PKExplanationViewController *)v9 setExplanationViewControllerDelegate:self];
  uint64_t v10 = [(PKPeerPaymentAccount *)self->_account instantWithdrawalPromotionFeatureDescriptor];
  uint64_t v11 = [v10 feePercentage];
  if (v11)
  {
    v19 = v10;
    BOOL v12 = v8;
    uint64_t v13 = v7;
    char v14 = v6;
    id v15 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v15 setNumberStyle:3];
    [v15 setMaximumFractionDigits:1];
    unint64_t v16 = [v15 stringFromNumber:v11];
    id v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_27.isa, &stru_1EF1B4C70.isa, v16);

    id v6 = v14;
    id v7 = v13;
    id v8 = v12;
    uint64_t v10 = v19;
  }
  else
  {
    id v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_28.isa);
  }
  [(PKPaymentAddDebitCardViewController *)v9 setBodyText:v17];
  [(PKPaymentAddDebitCardViewController *)v9 setShowDebitCardHeroView:0];
  [(PKExplanationViewController *)v9 setShowCancelButton:1];
  [(PKNavigationController *)v5 setModalInPresentation:1];
  [(PKNavigationController *)v5 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)v9 pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v5 setModalPresentationStyle:2];
  }
  [(PKNavigationController *)v5 pushViewController:v9 animated:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained peerPaymentActionController:self requestPresentViewController:v5];
}

- (unint64_t)controllerAction
{
  return self->_controllerAction;
}

- (void)setControllerAction:(unint64_t)a3
{
  self->_unint64_t controllerAction = a3;
}

- (PKPeerPaymentActionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentActionControllerDelegate *)WeakRetained;
}

- (PKBankAccountInformation)bankInformation
{
  return self->_bankInformation;
}

- (PKCurrencyAmount)thresholdAmount
{
  return self->_thresholdAmount;
}

- (void)setThresholdAmount:(id)a3
{
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
}

- (PKPaymentPass)alternateFundingSource
{
  return self->_alternateFundingSource;
}

- (void)setAlternateFundingSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateFundingSource, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_thresholdAmount, 0);
  objc_storeStrong((id *)&self->_bankInformation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end