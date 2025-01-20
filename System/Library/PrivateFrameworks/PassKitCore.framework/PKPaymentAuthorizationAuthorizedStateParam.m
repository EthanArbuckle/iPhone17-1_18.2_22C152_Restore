@interface PKPaymentAuthorizationAuthorizedStateParam
+ (id)paramWithApplePayTrustSignature:(id)a3;
+ (id)paramWithAuthorizedPeerPaymentQuote:(id)a3;
+ (id)paramWithInstallmentAuthorizationToken:(id)a3;
+ (id)paramWithPayment:(id)a3;
+ (id)paramWithPaymentToken:(id)a3 rewrapResponse:(id)a4;
+ (id)paramWithPurchase:(id)a3 purchaseTransactionIdentifier:(id)a4;
- (NSString)installmentAuthorizationToken;
- (NSString)purchaseTransactionIdentifier;
- (PKApplePayTrustSignature)applePayTrustSignature;
- (PKAuthorizedPeerPaymentQuote)authorizedPeerPaymentQuote;
- (PKPayment)payment;
- (PKPaymentRewrapResponseBase)rewrapResponse;
- (PKPaymentToken)paymentToken;
- (PKServiceProviderPurchase)purchase;
- (id)description;
- (void)setPayment:(id)a3;
- (void)setPaymentToken:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setPurchaseTransactionIdentifier:(id)a3;
- (void)setRewrapResponse:(id)a3;
@end

@implementation PKPaymentAuthorizationAuthorizedStateParam

+ (id)paramWithPaymentToken:(id)a3 rewrapResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 param];
  [v8 setPaymentToken:v7];

  [v8 setRewrapResponse:v6];
  return v8;
}

+ (id)paramWithPayment:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  [v5 setPayment:v4];

  return v5;
}

+ (id)paramWithPurchase:(id)a3 purchaseTransactionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 param];
  [v8 setPurchase:v7];

  [v8 setPurchaseTransactionIdentifier:v6];
  return v8;
}

+ (id)paramWithAuthorizedPeerPaymentQuote:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  id v6 = (void *)v5[6];
  v5[6] = v4;

  return v5;
}

+ (id)paramWithApplePayTrustSignature:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  id v6 = (void *)v5[7];
  v5[7] = v4;

  return v5;
}

+ (id)paramWithInstallmentAuthorizationToken:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  id v6 = (void *)v5[8];
  v5[8] = v4;

  return v5;
}

- (id)description
{
  if (self->_payment)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; payment: %@>",
      objc_opt_class(),
      self,
      self->_payment);
  }
  else
  {
    purchase = self->_purchase;
    id v4 = NSString;
    uint64_t v5 = objc_opt_class();
    if (purchase) {
      [v4 stringWithFormat:@"<%@: %p; purchase: %@>", v5, self, self->_purchase];
    }
    else {
      [v4 stringWithFormat:@"<%@: %p; paymentToken: %@>", v5, self, self->_paymentToken];
    }
  id v6 = };
  return v6;
}

- (PKPaymentToken)paymentToken
{
  return self->_paymentToken;
}

- (void)setPaymentToken:(id)a3
{
}

- (PKPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
}

- (PKPaymentRewrapResponseBase)rewrapResponse
{
  return self->_rewrapResponse;
}

- (void)setRewrapResponse:(id)a3
{
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (NSString)purchaseTransactionIdentifier
{
  return self->_purchaseTransactionIdentifier;
}

- (void)setPurchaseTransactionIdentifier:(id)a3
{
}

- (PKAuthorizedPeerPaymentQuote)authorizedPeerPaymentQuote
{
  return self->_authorizedPeerPaymentQuote;
}

- (PKApplePayTrustSignature)applePayTrustSignature
{
  return self->_applePayTrustSignature;
}

- (NSString)installmentAuthorizationToken
{
  return self->_installmentAuthorizationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_applePayTrustSignature, 0);
  objc_storeStrong((id *)&self->_authorizedPeerPaymentQuote, 0);
  objc_storeStrong((id *)&self->_purchaseTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_rewrapResponse, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_paymentToken, 0);
}

@end