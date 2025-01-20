@interface PKPhysicalCardActionController
- (BOOL)_canPerformActionWithState:(int64_t)a3;
- (PKAccount)account;
- (PKAccountUser)accountUser;
- (PKPhysicalCardActionController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 delegate:(id)a6;
- (id)_generatePaymentRequestWithSignatureRequest:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (int64_t)state;
- (void)_performAction:(id)a3 onPhysicalCard:(id)a4;
- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4;
- (void)_presentApplePayTrustWithPaymentRequest:(id)a3 completion:(id)a4;
- (void)_transitionToState:(int64_t)a3 withError:(id)a4;
- (void)activatePhysicalCard:(id)a3 withActivationCode:(id)a4;
- (void)activatePhysicalCardWithoutActivationCode:(id)a3;
- (void)cancelPhysicalCard:(id)a3;
- (void)disablePhysicalCard:(id)a3;
- (void)enablePhysicalCard:(id)a3;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)replacePhysicalCard:(id)a3 withReason:(unint64_t)a4;
@end

@implementation PKPhysicalCardActionController

- (PKPhysicalCardActionController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPhysicalCardActionController;
  v15 = [(PKPhysicalCardActionController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountService, a3);
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v16->_accountUser, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v17 = (PKPaymentDevice *)objc_alloc_init(MEMORY[0x1E4F84A90]);
    paymentDevice = v16->_paymentDevice;
    v16->_paymentDevice = v17;

    v16->_state = 0;
  }

  return v16;
}

- (void)activatePhysicalCard:(id)a3 withActivationCode:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6
    && [(PKPhysicalCardActionController *)self _canPerformActionWithState:self->_state])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F84E58]) initWithActionType:4];
    [v7 setActivationCode:v6];
    [(PKPhysicalCardActionController *)self _performAction:v7 onPhysicalCard:v8];
  }
}

- (void)activatePhysicalCardWithoutActivationCode:(id)a3
{
  id v5 = a3;
  if ([(PKPhysicalCardActionController *)self _canPerformActionWithState:self->_state])
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F84E58]) initWithActionType:4];
    [(PKPhysicalCardActionController *)self _performAction:v4 onPhysicalCard:v5];
  }
}

- (void)enablePhysicalCard:(id)a3
{
  id v5 = a3;
  if ([(PKPhysicalCardActionController *)self _canPerformActionWithState:self->_state])
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F84E58]) initWithActionType:1];
    [(PKPhysicalCardActionController *)self _performAction:v4 onPhysicalCard:v5];
  }
}

- (void)disablePhysicalCard:(id)a3
{
  id v5 = a3;
  if ([(PKPhysicalCardActionController *)self _canPerformActionWithState:self->_state])
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F84E58]) initWithActionType:2];
    [(PKPhysicalCardActionController *)self _performAction:v4 onPhysicalCard:v5];
  }
}

- (void)cancelPhysicalCard:(id)a3
{
  id v5 = a3;
  if ([(PKPhysicalCardActionController *)self _canPerformActionWithState:self->_state])
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F84E58]) initWithActionType:3];
    [(PKPhysicalCardActionController *)self _performAction:v4 onPhysicalCard:v5];
  }
}

- (void)replacePhysicalCard:(id)a3 withReason:(unint64_t)a4
{
  id v7 = a3;
  if ([(PKPhysicalCardActionController *)self _canPerformActionWithState:self->_state])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84E58]) initWithActionType:5];
    [v6 setReason:a4];
    [(PKPhysicalCardActionController *)self _performAction:v6 onPhysicalCard:v7];
  }
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_authorizationCoordinator == v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[PKPhysicalCardActionController paymentAuthorizationCoordinatorDidFinish:]";
      __int16 v10 = 2048;
      id v11 = self;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v6[3] = &unk_1E59CA870;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v6[3] = &unk_1E59CA7D0;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  return [v4 dismissWithCompletion:v6];
}

void __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 40))
  {
    uint64_t v3 = 2;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(v2 + 48);
    if (v4) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  [(id)v2 _transitionToState:v3 withError:v4];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [WeakRetained presentationSceneIdentifierForPhysicalCardActionController:self];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__PKPhysicalCardActionController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  v9[3] = &unk_1E59CA9F8;
  id v10 = v7;
  id v8 = v7;
  [(PKPhysicalCardActionController *)self _performApplePayTrustSignatureRequestWithSignature:a4 completion:v9];
}

void __109__PKPhysicalCardActionController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(uint64_t a1, int a2)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F84A30]) initWithStatus:a2 ^ 1u errors:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performAction:(id)a3 onPhysicalCard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PKPhysicalCardActionController *)self _transitionToState:1 withError:0];
  uint64_t v8 = [v6 actionType];
  paymentDevice = self->_paymentDevice;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke;
  v13[3] = &unk_1E59DBFA8;
  if (v8 == 5) {
    uint64_t v10 = 251;
  }
  else {
    uint64_t v10 = 0;
  }
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(PKPaymentDevice *)paymentDevice paymentDeviceMetadataFields:v10 completion:v13];
}

void __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void **)(a1[4] + 8);
  uint64_t v5 = (void *)a1[6];
  id v6 = a2;
  id v7 = [v5 identifier];
  uint64_t v8 = [*(id *)(a1[4] + 64) accountIdentifier];
  v9 = [*(id *)(a1[4] + 72) altDSID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_2;
  v10[3] = &unk_1E59DBF80;
  v10[4] = a1[4];
  [v4 beginPhysicalCardAction:v3 onPhysicalCardWithIdentifier:v7 forAccountWithIdentifier:v8 accountUserAltDSID:v9 deviceMetadata:v6 completion:v10];
}

void __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a6;
  id v13 = v12;
  if (!v10 || v12)
  {
    uint64_t v16 = [a4 count];
    if (v13 || !v16)
    {
      uint64_t v17 = 3;
      v18 = v13;
    }
    else
    {
      uint64_t v17 = 2;
      v18 = 0;
    }
    [*(id *)(a1 + 32) _transitionToState:v17 withError:v18];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a3);
    id v14 = [*(id *)(a1 + 32) _generatePaymentRequestWithSignatureRequest:v10];
    id v15 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_3;
    v19[3] = &unk_1E59CB6D8;
    v19[4] = v15;
    [v15 _presentApplePayTrustWithPaymentRequest:v14 completion:v19];
  }
}

uint64_t __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_3(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _transitionToState:3 withError:0];
  }
  return result;
}

- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  lastActionRequest = self->_lastActionRequest;
  if (lastActionRequest)
  {
    accountService = self->_accountService;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke;
    v11[3] = &unk_1E59DBFD0;
    v11[4] = self;
    id v12 = v7;
    [(PKAccountService *)accountService completePhysicalCardActionRequest:lastActionRequest withSignature:v6 completion:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2;
  block[3] = &unk_1E59CF3E0;
  id v16 = v7;
  id v17 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v18 = v9;
  uint64_t v19 = v10;
  id v20 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) count] && *(void *)(a1 + 40) && *(void *)(a1 + 48) == 0;
  *(unsigned char *)(*(void *)(a1 + 56) + 40) = v2;
  objc_storeStrong((id *)(*(void *)(a1 + 56) + 48), *(id *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_generatePaymentRequestWithSignatureRequest:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C28];
    id v4 = a3;
    uint64_t v5 = [v3 zero];
    id v6 = PKCurrencyAmountCreate(v5, (NSString *)*MEMORY[0x1E4F874A8]);

    id v7 = objc_alloc_init(MEMORY[0x1E4F84BE8]);
    [v7 setRequestType:4];
    id v8 = [v6 currency];
    [v7 setCurrencyCode:v8];

    [v7 setClientCallbackTimeout:65.0];
    [v7 setConfirmationStyle:1];
    id v9 = PKLocalizedFeatureString();
    [v7 setLocalizedErrorMessage:v9];

    uint64_t v10 = PKLocalizedFeatureString();
    [v7 setLocalizedAuthorizingTitle:v10];

    id v11 = (void *)MEMORY[0x1E4F84CE0];
    id v12 = PKLocalizedFeatureString();
    id v13 = [v6 amount];
    id v14 = [v11 summaryItemWithLabel:v12 amount:v13];
    v17[0] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v7 setPaymentSummaryItems:v15];

    [v7 setSuppressTotal:1];
    [v7 setApplePayTrustSignatureRequest:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_presentApplePayTrustWithPaymentRequest:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (PKPaymentAuthorizationCoordinator *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:v6];
    authorizationCoordinator = self->_authorizationCoordinator;
    self->_authorizationCoordinator = v8;

    [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator setDelegate:self];
    [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator _setPrivateDelegate:self];
    uint64_t v10 = self->_authorizationCoordinator;
    if (v10)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __85__PKPhysicalCardActionController__presentApplePayTrustWithPaymentRequest_completion___block_invoke;
      v12[3] = &unk_1E59CA9F8;
      id v13 = v7;
      [(PKPaymentAuthorizationCoordinator *)v10 presentWithCompletion:v12];

      goto LABEL_9;
    }
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "-[PKPhysicalCardActionController _presentApplePayTrustWithPaymentRequest:completion:]";
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 2048;
      id v19 = v6;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "%s %p: PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %p.", buf, 0x20u);
    }
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_9:
}

uint64_t __85__PKPhysicalCardActionController__presentApplePayTrustWithPaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_canPerformActionWithState:(int64_t)a3
{
  return ((unint64_t)a3 < 4) & (0xDu >> (a3 & 0xF));
}

- (void)_transitionToState:(int64_t)a3 withError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_state != a3)
  {
    self->_state = a3;
    if ((unint64_t)a3 > 3) {
      id v7 = 0;
    }
    else {
      id v7 = off_1E59DBFF0[a3];
    }
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPhysicalCardController transitioning to state: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained physicalCardActionController:self didChangeToState:a3 withError:v6];
  }
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_lastActionError, 0);
  objc_storeStrong((id *)&self->_lastActionRequest, 0);
  objc_storeStrong((id *)&self->_paymentDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end