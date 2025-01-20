@interface PKPaymentAuthorizationServiceProxy
- (PKEntitlementWhitelist)entitlementWhitelist;
- (PKPaymentAuthorizationServiceProtocol)delegate;
- (PKPaymentAuthorizationServiceProxy)initWithConnection:(id)a3 paymentRequest:(id)a4;
- (id)_sanitizeMerchantSessionUpdate:(id)a3;
- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3;
- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3;
- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4;
- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4;
- (void)handleDismissWithCompletion:(id)a3;
- (void)handleHostApplicationDidBecomeActive;
- (void)handleHostApplicationDidCancel;
- (void)handleHostApplicationWillResignActive:(BOOL)a3;
- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPaymentAuthorizationServiceProxy

- (PKEntitlementWhitelist)entitlementWhitelist
{
  entitlementWhitelist = self->_entitlementWhitelist;
  if (!entitlementWhitelist)
  {
    v4 = (PKEntitlementWhitelist *)[objc_alloc(MEMORY[0x1E4F846C8]) initWithConnection:self->_connection];
    v5 = self->_entitlementWhitelist;
    self->_entitlementWhitelist = v4;

    entitlementWhitelist = self->_entitlementWhitelist;
  }

  return entitlementWhitelist;
}

- (PKPaymentAuthorizationServiceProxy)initWithConnection:(id)a3 paymentRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationServiceProxy;
  v9 = [(PKPaymentAuthorizationServiceProxy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_paymentRequest, a4);
  }

  return v10;
}

- (void)handleHostApplicationDidCancel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidCancel__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidCancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained handleHostApplicationDidCancel];
}

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PKPaymentAuthorizationServiceProxy_handleHostApplicationWillResignActive___block_invoke;
  v3[3] = &unk_1E59CDA78;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __76__PKPaymentAuthorizationServiceProxy_handleHostApplicationWillResignActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained handleHostApplicationWillResignActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)handleHostApplicationDidBecomeActive
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidBecomeActive__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidBecomeActive__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained handleHostApplicationDidBecomeActive];
}

- (void)handleDismissWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKPaymentAuthorizationServiceProxy_handleDismissWithCompletion___block_invoke;
  v6[3] = &unk_1E59CAD18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __66__PKPaymentAuthorizationServiceProxy_handleDismissWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained handleDismissWithCompletion:*(void *)(a1 + 40)];
}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentAuthorizationServiceProxy_fulfillRemotePaymentRequestPromise_completion___block_invoke;
  block[3] = &unk_1E59CE110;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__PKPaymentAuthorizationServiceProxy_fulfillRemotePaymentRequestPromise_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  [WeakRetained fulfillRemotePaymentRequestPromise:a1[5] completion:a1[6]];
}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__PKPaymentAuthorizationServiceProxy_rejectRemotePaymentRequestPromiseWithFailure___block_invoke;
  v3[3] = &unk_1E59CB460;
  v3[4] = self;
  void v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __83__PKPaymentAuthorizationServiceProxy_rejectRemotePaymentRequestPromiseWithFailure___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained rejectRemotePaymentRequestPromiseWithFailure:*(void *)(a1 + 40)];
}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__PKPaymentAuthorizationServiceProxy_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __95__PKPaymentAuthorizationServiceProxy_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _sanitizeMerchantSessionUpdate:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidRequestMerchantSessionCompleteWithUpdate:v3];
}

- (id)_sanitizeMerchantSessionUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 status]
    || ([(PKPaymentAuthorizationServiceProxy *)self entitlementWhitelist],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 session],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 isEntitledForMerchantSession:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F84BF8]) initWithStatus:1 merchantSession:0];
  }
  else
  {
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeContextCompleteWithResult___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeContextCompleteWithResult___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    [WeakRetained authorizationDidAuthorizeContextCompleteWithResult:*(void *)(a1 + 32)];
  }
  else
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      id v4 = [*(id *)(*(void *)(a1 + 40) + 24) merchantIdentifier];
      *(_DWORD *)buf = 138412290;
      id v7 = v4;
      _os_log_fault_impl(&dword_19F450000, v2, OS_LOG_TYPE_FAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(*(void *)(a1 + 40) + 24) merchantIdentifier];
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);
    }
  }
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    [WeakRetained authorizationDidAuthorizePaymentCompleteWithResult:*(void *)(a1 + 32)];
  }
  else
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      id v4 = [*(id *)(*(void *)(a1 + 40) + 24) merchantIdentifier];
      *(_DWORD *)buf = 138412290;
      id v7 = v4;
      _os_log_fault_impl(&dword_19F450000, v2, OS_LOG_TYPE_FAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(*(void *)(a1 + 40) + 24) merchantIdentifier];
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);
    }
  }
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke;
  v3[3] = &unk_1E59CB460;
  v3[4] = self;
  void v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __90__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidAuthorizePurchaseCompleteWithStatus:*(void *)(a1 + 40)];
}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __98__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:*(void *)(a1 + 40)];
}

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __104__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __104__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:*(void *)(a1 + 40)];
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__PKPaymentAuthorizationServiceProxy_authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate_signatureRequest___block_invoke;
  block[3] = &unk_1E59CA8E8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __123__PKPaymentAuthorizationServiceProxy_authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate_signatureRequest___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  [WeakRetained authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:a1[5] signatureRequest:a1[6]];
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __93__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidSelectShippingMethodCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __94__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidSelectShippingAddressCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __92__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidSelectPaymentMethodCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (void)authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __105__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidSelectPaymentMethodCompleteWithUpdate:0];
}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__PKPaymentAuthorizationServiceProxy_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __89__PKPaymentAuthorizationServiceProxy_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained authorizationDidChangeCouponCodeCompleteWithUpdate:*(void *)(a1 + 40)];
}

- (PKPaymentAuthorizationServiceProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationServiceProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementWhitelist, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end