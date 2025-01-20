@interface PKPaymentAuthorizationCoordinatorExportedObject
- (PKPaymentAuthorizationCoordinator)controller;
- (PKPaymentAuthorizationCoordinatorDelegate)delegate;
- (PKPaymentAuthorizationCoordinatorExportedObject)init;
- (PKPaymentAuthorizationCoordinatorExportedObject)initWithController:(id)a3;
- (PKPaymentAuthorizationCoordinatorPrivateDelegate)privateDelegate;
- (PKPaymentAuthorizationServiceProtocol)serviceProxy;
- (void)authorizationDidAuthorizeApplePayTrustSignature:(id)a3;
- (void)authorizationDidAuthorizeContext;
- (void)authorizationDidAuthorizePayment:(id)a3;
- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3;
- (void)authorizationDidAuthorizePurchase:(id)a3;
- (void)authorizationDidChangeCouponCode:(id)a3;
- (void)authorizationDidFinishWithError:(id)a3;
- (void)authorizationDidRequestMerchantSession;
- (void)authorizationDidSelectPaymentMethod:(id)a3;
- (void)authorizationDidSelectShippingAddress:(id)a3;
- (void)authorizationDidSelectShippingMethod:(id)a3;
- (void)authorizationDidUpdateAccountServicePaymentMethod:(id)a3;
- (void)authorizationWillStart;
- (void)dealloc;
- (void)didEncounterAuthorizationEvent:(unint64_t)a3;
- (void)handleConnectionDidOpenWithCompletion:(id)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setServiceProxy:(id)a3;
@end

@implementation PKPaymentAuthorizationCoordinatorExportedObject

- (PKPaymentAuthorizationCoordinatorExportedObject)init
{
  return [(PKPaymentAuthorizationCoordinatorExportedObject *)self initWithController:0];
}

- (PKPaymentAuthorizationCoordinatorExportedObject)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationCoordinatorExportedObject;
  v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    v6->_delegateLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationCoordinatorExportedObject;
  [(PKPaymentAuthorizationCoordinatorExportedObject *)&v2 dealloc];
}

- (void)handleConnectionDidOpenWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)didEncounterAuthorizationEvent:(unint64_t)a3
{
  id v6 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [v6 paymentAuthorizationCoordinator:WeakRetained didEncounterAuthorizationEvent:a3];
  }
}

- (void)authorizationWillStart
{
  id v4 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [v4 paymentAuthorizationCoordinatorWillAuthorizePayment:WeakRetained];
  }
}

- (void)authorizationDidRequestMerchantSession
{
  v3 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentRequestMerchantSessionUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidRequestMerchantSession__block_invoke;
    v5[3] = &unk_1E56E2590;
    v5[4] = self;
    [v3 paymentAuthorizationCoordinator:WeakRetained didRequestMerchantSessionUpdate:v5];
  }
  else
  {
    id WeakRetained = [[PKPaymentRequestMerchantSessionUpdate alloc] initWithStatus:1 merchantSession:0];
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidRequestMerchantSessionCompleteWithUpdate:WeakRetained];
  }
}

uint64_t __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidRequestMerchantSession__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidRequestMerchantSessionCompleteWithUpdate:a2];
}

- (void)authorizationDidFinishWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [v5 paymentAuthorizationCoordinator:WeakRetained willFinishWithError:v8];
  }
  id v7 = objc_loadWeakRetained((id *)&self->_controller);
  [v4 paymentAuthorizationCoordinatorDidFinish:v7];
}

- (void)authorizationDidAuthorizeContext
{
  v3 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentAuthorizationResult *)objc_loadWeakRetained((id *)&self->_controller);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeContext__block_invoke;
    v5[3] = &unk_1E56E25B8;
    v5[4] = self;
    [v3 paymentAuthorizationCoordinator:WeakRetained didAuthorizeContextWithHandler:v5];
  }
  else
  {
    id WeakRetained = [[PKPaymentAuthorizationResult alloc] initWithStatus:0 errors:0];
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidAuthorizeContextCompleteWithResult:WeakRetained];
  }
}

uint64_t __83__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeContext__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidAuthorizeContextCompleteWithResult:a2];
}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke;
    v9[3] = &unk_1E56E25B8;
    v9[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didAuthorizePayment:v4 handler:v9];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke_2;
    v8[3] = &unk_1E56E25E0;
    v8[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didAuthorizePayment:v4 completion:v8];
  }
}

uint64_t __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidAuthorizePaymentCompleteWithResult:a2];
}

void __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(PKPaymentAuthorizationResult);
  [(PKPaymentAuthorizationResult *)v4 setStatus:a2];
  [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidAuthorizePaymentCompleteWithResult:v4];
}

- (void)authorizationDidAuthorizePurchase:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __85__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePurchase___block_invoke;
    v7[3] = &unk_1E56E25E0;
    v7[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didAuthorizePurchase:v4 completion:v7];
  }
  else
  {
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidAuthorizePurchaseCompleteWithStatus:0];
  }
}

uint64_t __85__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePurchase___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidAuthorizePurchaseCompleteWithStatus:a2];
}

- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __93__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePeerPaymentQuote___block_invoke;
    v7[3] = &unk_1E56E25B8;
    v7[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didAuthorizePeerPaymentQuote:v4 handler:v7];
  }
  else
  {
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidAuthorizePurchaseCompleteWithStatus:0];
  }
}

uint64_t __93__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePeerPaymentQuote___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:a2];
}

- (void)authorizationDidAuthorizeApplePayTrustSignature:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __99__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeApplePayTrustSignature___block_invoke;
    v7[3] = &unk_1E56E25B8;
    v7[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didAuthorizeApplePayTrustSignature:v4 handler:v7];
  }
  else
  {
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidAuthorizePurchaseCompleteWithStatus:0];
  }
}

uint64_t __99__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeApplePayTrustSignature___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:a2];
}

- (void)authorizationDidUpdateAccountServicePaymentMethod:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[PKPaymentAuthorizationCoordinatorExportedObject authorizationDidUpdateAccountServicePaymentMethod:]";
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  char v6 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __101__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidUpdateAccountServicePaymentMethod___block_invoke;
    v8[3] = &unk_1E56E2608;
    v8[4] = self;
    [v6 paymentAuthorizationCoordinator:WeakRetained didUpdateAccountServicePaymentMethod:v4 handler:v8];
  }
  else
  {
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:0 signatureRequest:0];
  }
}

uint64_t __101__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidUpdateAccountServicePaymentMethod___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:a2 signatureRequest:a3];
}

- (void)authorizationDidSelectShippingMethod:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentRequestShippingMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke;
    v8[3] = &unk_1E56E2630;
    v8[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didSelectShippingMethod:v4 handler:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentRequestShippingMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke_2;
    v7[3] = &unk_1E56E2658;
    v7[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didSelectShippingMethod:v4 completion:v7];
  }
  else
  {
    id WeakRetained = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
    [(PKPaymentRequestUpdate *)WeakRetained setStatus:0];
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidSelectShippingMethodCompleteWithUpdate:WeakRetained];
  }
}

uint64_t __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidSelectShippingMethodCompleteWithUpdate:a2];
}

void __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  char v6 = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
  [(PKPaymentRequestUpdate *)v6 setStatus:a2];
  [(PKPaymentRequestUpdate *)v6 setPaymentSummaryItems:v5];

  [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidSelectShippingMethodCompleteWithUpdate:v6];
}

- (void)authorizationDidSelectShippingAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentRequestShippingContactUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke;
    v8[3] = &unk_1E56E2680;
    v8[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didSelectShippingAddress:v4 handler:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentRequestShippingContactUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke_2;
    v7[3] = &unk_1E56E26A8;
    v7[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didSelectShippingAddress:v4 completion:v7];
  }
  else
  {
    id WeakRetained = objc_alloc_init(PKPaymentRequestShippingContactUpdate);
    [(PKPaymentRequestUpdate *)WeakRetained setStatus:0];
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidSelectShippingAddressCompleteWithUpdate:WeakRetained];
  }
}

uint64_t __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidSelectShippingAddressCompleteWithUpdate:a2];
}

void __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  v9 = [PKPaymentRequestShippingContactUpdate alloc];
  v10 = [(PKPaymentRequestShippingContactUpdate *)v9 initWithErrors:MEMORY[0x1E4F1CBF0] paymentSummaryItems:v7 shippingMethods:v8];

  [(PKPaymentRequestUpdate *)v10 setStatus:a2];
  [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidSelectShippingAddressCompleteWithUpdate:v10];
}

- (void)authorizationDidSelectPaymentMethod:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentRequestPaymentMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke;
    v8[3] = &unk_1E56E26D0;
    v8[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didSelectPaymentMethod:v4 handler:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    id WeakRetained = (PKPaymentRequestPaymentMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke_2;
    v7[3] = &unk_1E56E26F8;
    v7[4] = self;
    [v5 paymentAuthorizationCoordinator:WeakRetained didSelectPaymentMethod:v4 completion:v7];
  }
  else
  {
    id WeakRetained = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidSelectPaymentMethodCompleteWithUpdate:WeakRetained];
  }
}

uint64_t __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidSelectPaymentMethodCompleteWithUpdate:a2];
}

void __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  [(PKPaymentRequestUpdate *)v4 setPaymentSummaryItems:v3];

  [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidSelectPaymentMethodCompleteWithUpdate:v4];
}

- (void)authorizationDidChangeCouponCode:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationCoordinatorExportedObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidChangeCouponCode___block_invoke;
    aBlock[3] = &unk_1E56E2720;
    aBlock[4] = self;
    char v6 = (PKPaymentRequestCouponCodeUpdate *)_Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [v5 paymentAuthorizationCoordinator:WeakRetained didChangeCouponCode:v4 handler:v6];
  }
  else
  {
    char v6 = objc_alloc_init(PKPaymentRequestCouponCodeUpdate);
    [(PKPaymentAuthorizationServiceProtocol *)self->_serviceProxy authorizationDidChangeCouponCodeCompleteWithUpdate:v6];
  }
}

uint64_t __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidChangeCouponCode___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) authorizationDidChangeCouponCodeCompleteWithUpdate:a2];
}

- (PKPaymentAuthorizationCoordinatorDelegate)delegate
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_delegateLock);
  return (PKPaymentAuthorizationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_delegateLock = &self->_delegateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_delegateLock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_delegateLock);
}

- (PKPaymentAuthorizationCoordinatorPrivateDelegate)privateDelegate
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);
  os_unfair_lock_unlock(p_delegateLock);
  return (PKPaymentAuthorizationCoordinatorPrivateDelegate *)WeakRetained;
}

- (void)setPrivateDelegate:(id)a3
{
  p_delegateLock = &self->_delegateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_delegateLock);
  objc_storeWeak((id *)&self->_privateDelegate, v5);

  os_unfair_lock_unlock(p_delegateLock);
}

- (PKPaymentAuthorizationCoordinator)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (PKPaymentAuthorizationCoordinator *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (PKPaymentAuthorizationServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end