@interface PKExtensionHostContext
- (OS_dispatch_group)delayCallbacksGroup;
- (PKExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (PKPaymentAuthorizationHostProtocol)delegate;
- (void)authorizationDidAuthorizePayment:(id)a3;
- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3;
- (void)authorizationDidAuthorizePurchase:(id)a3;
- (void)authorizationDidChangeCouponCode:(id)a3;
- (void)authorizationDidFinishWithError:(id)a3;
- (void)authorizationDidPresent;
- (void)authorizationDidRequestMerchantSession;
- (void)authorizationDidSelectPaymentMethod:(id)a3;
- (void)authorizationDidSelectShippingAddress:(id)a3;
- (void)authorizationDidSelectShippingMethod:(id)a3;
- (void)authorizationWillStart;
- (void)beginDelayingCallbacks;
- (void)didEncounterAuthorizationEvent:(unint64_t)a3;
- (void)endDelayingCallbacks;
- (void)setDelayCallbacksGroup:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKExtensionHostContext

- (PKExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PKExtensionHostContext;
  v5 = [(PKExtensionHostContext *)&v9 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  if (v5)
  {
    dispatch_group_t v6 = dispatch_group_create();
    delayCallbacksGroup = v5->_delayCallbacksGroup;
    v5->_delayCallbacksGroup = (OS_dispatch_group *)v6;
  }
  return v5;
}

- (void)beginDelayingCallbacks
{
}

- (void)endDelayingCallbacks
{
}

- (void)authorizationWillStart
{
  delayCallbacksGroup = self->_delayCallbacksGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PKExtensionHostContext_authorizationWillStart__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], block);
}

void __48__PKExtensionHostContext_authorizationWillStart__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 authorizationWillStart];
}

- (void)authorizationDidFinishWithError:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PKExtensionHostContext_authorizationDidFinishWithError___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __58__PKExtensionHostContext_authorizationDidFinishWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidFinishWithError:*(void *)(a1 + 40)];
}

- (void)authorizationDidRequestMerchantSession
{
  delayCallbacksGroup = self->_delayCallbacksGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKExtensionHostContext_authorizationDidRequestMerchantSession__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], block);
}

void __64__PKExtensionHostContext_authorizationDidRequestMerchantSession__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 authorizationDidRequestMerchantSession];
}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKExtensionHostContext_authorizationDidAuthorizePayment___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __59__PKExtensionHostContext_authorizationDidAuthorizePayment___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidAuthorizePayment:*(void *)(a1 + 40)];
}

- (void)authorizationDidAuthorizePurchase:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PKExtensionHostContext_authorizationDidAuthorizePurchase___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __60__PKExtensionHostContext_authorizationDidAuthorizePurchase___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidAuthorizePurchase:*(void *)(a1 + 40)];
}

- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKExtensionHostContext_authorizationDidAuthorizePeerPaymentQuote___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __68__PKExtensionHostContext_authorizationDidAuthorizePeerPaymentQuote___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidAuthorizePeerPaymentQuote:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectShippingMethod:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKExtensionHostContext_authorizationDidSelectShippingMethod___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __63__PKExtensionHostContext_authorizationDidSelectShippingMethod___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidSelectShippingMethod:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectShippingAddress:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKExtensionHostContext_authorizationDidSelectShippingAddress___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __64__PKExtensionHostContext_authorizationDidSelectShippingAddress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidSelectShippingAddress:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectPaymentMethod:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKExtensionHostContext_authorizationDidSelectPaymentMethod___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __62__PKExtensionHostContext_authorizationDidSelectPaymentMethod___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidSelectPaymentMethod:*(void *)(a1 + 40)];
}

- (void)authorizationDidChangeCouponCode:(id)a3
{
  id v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKExtensionHostContext_authorizationDidChangeCouponCode___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v7);
}

void __59__PKExtensionHostContext_authorizationDidChangeCouponCode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationDidChangeCouponCode:*(void *)(a1 + 40)];
}

- (void)authorizationDidPresent
{
  delayCallbacksGroup = self->_delayCallbacksGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PKExtensionHostContext_authorizationDidPresent__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], block);
}

void __49__PKExtensionHostContext_authorizationDidPresent__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 authorizationDidPresent];
  }
}

- (void)didEncounterAuthorizationEvent:(unint64_t)a3
{
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PKExtensionHostContext_didEncounterAuthorizationEvent___block_invoke;
  v4[3] = &unk_1E56DE608;
  v4[4] = self;
  v4[5] = a3;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E4F14428], v4);
}

void __57__PKExtensionHostContext_didEncounterAuthorizationEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 didEncounterAuthorizationEvent:*(void *)(a1 + 40)];
  }
}

- (PKPaymentAuthorizationHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentAuthorizationHostProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_group)delayCallbacksGroup
{
  return self->_delayCallbacksGroup;
}

- (void)setDelayCallbacksGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayCallbacksGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end