@interface PKPassbookPeerPaymentSettingsDefaultBehavior
- (PKPassbookPeerPaymentSettingsDefaultBehavior)init;
- (id)peerPaymentWebService;
- (void)_registerForPeerPaymentWithCompletion:(id)a3;
- (void)_unregisterForPeerPaymentWithCompletion:(id)a3;
- (void)peerPaymentRegistrationStatusHasChanged:(BOOL)a3 completion:(id)a4;
@end

@implementation PKPassbookPeerPaymentSettingsDefaultBehavior

- (PKPassbookPeerPaymentSettingsDefaultBehavior)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassbookPeerPaymentSettingsDefaultBehavior;
  v2 = [(PKPassbookPeerPaymentSettingsDefaultBehavior *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F84D50] sharedService];
    paymentWebService = v2->_paymentWebService;
    v2->_paymentWebService = (PKPaymentWebService *)v3;

    uint64_t v5 = [MEMORY[0x1E4F84E10] sharedService];
    peerPaymentWebService = v2->_peerPaymentWebService;
    v2->_peerPaymentWebService = (PKPeerPaymentWebService *)v5;
  }
  return v2;
}

- (id)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)peerPaymentRegistrationStatusHasChanged:(BOOL)a3 completion:(id)a4
{
  if (a3)
  {
    uint64_t v5 = *MEMORY[0x1E4F85F30];
    id v6 = a4;
    MEMORY[0x1A6220EC0](v5, 0);
    [(PKPassbookPeerPaymentSettingsDefaultBehavior *)self _registerForPeerPaymentWithCompletion:v6];
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F85F20];
    id v8 = a4;
    MEMORY[0x1A6220EC0](v7, 0);
    [(PKPassbookPeerPaymentSettingsDefaultBehavior *)self _unregisterForPeerPaymentWithCompletion:v8];
  }
}

- (void)_registerForPeerPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentWebService *)self->_paymentWebService needsRegistration])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:self->_paymentWebService];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__PKPassbookPeerPaymentSettingsDefaultBehavior__registerForPeerPaymentWithCompletion___block_invoke;
    v7[3] = &unk_1E59D2210;
    id v8 = v5;
    v9 = self;
    id v10 = v4;
    id v6 = v5;
    [v6 validatePreconditionsAndRegister:v7];
  }
  else
  {
    id v6 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService peerPaymentService];
    [v6 registerDeviceWithCompletion:v4];
  }
}

void __86__PKPassbookPeerPaymentSettingsDefaultBehavior__registerForPeerPaymentWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5 || !a2)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = v5;
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  else
  {
    id v8 = 0;
    id v6 = [*(id *)(*(void *)(a1 + 40) + 16) peerPaymentService];
    [v6 registerDeviceWithCompletion:*(void *)(a1 + 48)];
  }
  id v5 = v8;
LABEL_7:
}

- (void)_unregisterForPeerPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService peerPaymentService];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__PKPassbookPeerPaymentSettingsDefaultBehavior__unregisterForPeerPaymentWithCompletion___block_invoke;
  v7[3] = &unk_1E59CE160;
  id v8 = v4;
  id v6 = v4;
  [v5 unregisterDeviceWithCompletion:v7];
}

uint64_t __88__PKPassbookPeerPaymentSettingsDefaultBehavior__unregisterForPeerPaymentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);

  objc_storeStrong((id *)&self->_paymentWebService, 0);
}

@end