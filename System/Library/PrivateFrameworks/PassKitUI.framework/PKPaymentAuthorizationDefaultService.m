@interface PKPaymentAuthorizationDefaultService
- (PKPaymentAuthorizationPresenter)presenter;
- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3;
- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3;
- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4;
- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4;
- (void)handleDismissWithCompletion:(id)a3;
- (void)handleHostApplicationDidBecomeActive;
- (void)handleHostApplicationWillResignActive:(BOOL)a3;
- (void)hostCallDidGoUnhandledForMethod:(id)a3;
- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3;
- (void)setPresenter:(id)a3;
@end

@implementation PKPaymentAuthorizationDefaultService

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v5];
}

- (void)handleDismissWithCompletion:(id)a3
{
  p_presenter = &self->_presenter;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  [WeakRetained dismissWithReason:2 error:0 completion:v4];
}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v5];
}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)handleHostApplicationDidBecomeActive
{
  NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v3];
}

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationDefaultService *)self hostCallDidGoUnhandledForMethod:v4];
}

- (void)hostCallDidGoUnhandledForMethod:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ was called, but no service is present to handle the call.", (uint8_t *)&v5, 0xCu);
  }
}

- (PKPaymentAuthorizationPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (PKPaymentAuthorizationPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end