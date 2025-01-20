@interface PKExtensionVendorContext
- (id)entitlementWhitelist;
- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePaymentCompleteWithStatus:(int64_t)a3;
- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3;
- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3;
- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingAddressCompleteWithStatus:(int64_t)a3 shippingMethods:(id)a4 paymentSummaryItems:(id)a5;
- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingMethodCompleteWithStatus:(int64_t)a3 paymentSummaryItems:(id)a4;
- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3;
- (void)handleDismissWithCompletion:(id)a3;
- (void)handleHostApplicationDidBecomeActive;
- (void)handleHostApplicationDidCancel;
- (void)handleHostApplicationWillResignActive:(BOOL)a3;
- (void)prepareWithPaymentRequest:(id)a3 completion:(id)a4;
@end

@implementation PKExtensionVendorContext

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PKExtensionVendorContext_handleHostApplicationWillResignActive___block_invoke;
  v3[3] = &unk_1E56D8B80;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __66__PKExtensionVendorContext_handleHostApplicationWillResignActive___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 handleHostApplicationWillResignActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)handleHostApplicationDidBecomeActive
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKExtensionVendorContext_handleHostApplicationDidBecomeActive__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__PKExtensionVendorContext_handleHostApplicationDidBecomeActive__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _principalObject];
  [v1 handleHostApplicationDidBecomeActive];
}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PKExtensionVendorContext_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __85__PKExtensionVendorContext_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status]
    || ([*(id *)(a1 + 40) entitlementWhitelist],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) session],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v2 isEntitledForMerchantSession:v3],
        v3,
        v2,
        !v4))
  {
    id v5 = [[PKPaymentRequestMerchantSessionUpdate alloc] initWithStatus:1 merchantSession:0];
  }
  else
  {
    id v5 = (PKPaymentRequestMerchantSessionUpdate *)*(id *)(a1 + 32);
  }
  id v7 = v5;
  v6 = [*(id *)(a1 + 40) _principalObject];
  [v6 authorizationDidRequestMerchantSessionCompleteWithUpdate:v7];
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidAuthorizePaymentCompleteWithResult:*(void *)(a1 + 40)];
}

- (void)authorizationDidAuthorizePaymentCompleteWithStatus:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithStatus___block_invoke;
  v3[3] = &unk_1E56DE608;
  v3[4] = self;
  void v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithStatus___block_invoke(uint64_t a1)
{
  v3 = objc_alloc_init(PKPaymentAuthorizationResult);
  [(PKPaymentAuthorizationResult *)v3 setStatus:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidAuthorizePaymentCompleteWithResult:v3];
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PKExtensionVendorContext_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke;
  v3[3] = &unk_1E56DE608;
  v3[4] = self;
  void v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __80__PKExtensionVendorContext_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidAuthorizePurchaseCompleteWithStatus:*(void *)(a1 + 40)];
}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__PKExtensionVendorContext_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __88__PKExtensionVendorContext_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __83__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidSelectShippingMethodCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectShippingMethodCompleteWithStatus:(int64_t)a3 paymentSummaryItems:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithStatus_paymentSummaryItems___block_invoke;
  block[3] = &unk_1E56DF798;
  v10 = self;
  int64_t v11 = a3;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __103__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithStatus_paymentSummaryItems___block_invoke(uint64_t a1)
{
  v3 = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
  [(PKPaymentRequestUpdate *)v3 setStatus:*(void *)(a1 + 48)];
  [(PKPaymentRequestUpdate *)v3 setPaymentSummaryItems:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) _principalObject];
  [v2 authorizationDidSelectShippingMethodCompleteWithUpdate:v3];
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __84__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidSelectShippingAddressCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectShippingAddressCompleteWithStatus:(int64_t)a3 shippingMethods:(id)a4 paymentSummaryItems:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithStatus_shippingMethods_paymentSummaryItems___block_invoke;
  v12[3] = &unk_1E56E9BF8;
  id v13 = v9;
  id v14 = v8;
  v15 = self;
  int64_t v16 = a3;
  id v10 = v8;
  id v11 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __120__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithStatus_shippingMethods_paymentSummaryItems___block_invoke(uint64_t a1)
{
  id v2 = [PKPaymentRequestShippingContactUpdate alloc];
  id v4 = [(PKPaymentRequestShippingContactUpdate *)v2 initWithErrors:MEMORY[0x1E4F1CBF0] paymentSummaryItems:*(void *)(a1 + 32) shippingMethods:*(void *)(a1 + 40)];
  [(PKPaymentRequestUpdate *)v4 setStatus:*(void *)(a1 + 56)];
  v3 = [*(id *)(a1 + 48) _principalObject];
  [v3 authorizationDidSelectShippingAddressCompleteWithUpdate:v4];
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __82__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidSelectPaymentMethodCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __95__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke(uint64_t a1)
{
  v3 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  [(PKPaymentRequestUpdate *)v3 setPaymentSummaryItems:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) _principalObject];
  [v2 authorizationDidSelectPaymentMethodCompleteWithUpdate:v3];
}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKExtensionVendorContext_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __79__PKExtensionVendorContext_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 authorizationDidChangeCouponCodeCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (void)handleHostApplicationDidCancel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKExtensionVendorContext_handleHostApplicationDidCancel__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PKExtensionVendorContext_handleHostApplicationDidCancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _principalObject];
  if (objc_opt_respondsToSelector()) {
    [v1 handleHostApplicationDidCancel];
  }
}

- (void)handleDismissWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKExtensionVendorContext_handleDismissWithCompletion___block_invoke;
  v6[3] = &unk_1E56D8A18;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__PKExtensionVendorContext_handleDismissWithCompletion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _principalObject];
  char v2 = objc_opt_respondsToSelector();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    [v4 handleDismissWithCompletion:v3];
  }
  else if (v3)
  {
    (*(void (**)(void))(v3 + 16))(*(void *)(a1 + 40));
  }
}

- (void)prepareWithPaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKExtensionVendorContext_prepareWithPaymentRequest_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PKExtensionVendorContext_prepareWithPaymentRequest_completion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) entitlementWhitelist];
  int v3 = [v2 isEntitledForPaymentRequest:*(void *)(a1 + 40)];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) _principalObject];
    if (objc_opt_respondsToSelector()) {
      [v5 prepareWithPaymentRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (!v4) {
      return;
    }
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:4 userInfo:0];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (id)entitlementWhitelist
{
  whitelist = self->_whitelist;
  if (!whitelist)
  {
    uint64_t v4 = [PKEntitlementWhitelist alloc];
    id v5 = [(PKExtensionVendorContext *)self _auxiliaryConnection];
    id v6 = [(PKEntitlementWhitelist *)v4 initWithConnection:v5];
    id v7 = self->_whitelist;
    self->_whitelist = v6;

    whitelist = self->_whitelist;
  }
  return whitelist;
}

- (void).cxx_destruct
{
}

@end