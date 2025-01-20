@interface PKPaymentAuthorizationClientCallbackStateParam
+ (PKPaymentAuthorizationClientCallbackStateParam)paramWithCallbackKind:(int64_t)a3 object:(id)a4;
- (CNContact)shippingContact;
- (NSString)couponCode;
- (PKAccountServicePaymentMethod)accountServicePaymentMethod;
- (PKApplePayTrustSignature)applePayTrustSignature;
- (PKAuthorizedPeerPaymentQuote)authorizedPeerPaymentQuote;
- (PKPayment)payment;
- (PKPaymentMethod)paymentMethod;
- (PKServiceProviderPurchase)purchase;
- (PKShippingMethod)shippingMethod;
- (id)description;
- (id)object;
- (int64_t)kind;
- (void)setKind:(int64_t)a3;
- (void)setObject:(id)a3;
@end

@implementation PKPaymentAuthorizationClientCallbackStateParam

+ (PKPaymentAuthorizationClientCallbackStateParam)paramWithCallbackKind:(int64_t)a3 object:(id)a4
{
  id v6 = a4;
  v7 = [a1 param];
  [v7 setKind:a3];
  [v7 setObject:v6];

  return (PKPaymentAuthorizationClientCallbackStateParam *)v7;
}

- (NSString)couponCode
{
  return (NSString *)self->_object;
}

- (CNContact)shippingContact
{
  return (CNContact *)self->_object;
}

- (PKPaymentMethod)paymentMethod
{
  return (PKPaymentMethod *)self->_object;
}

- (PKShippingMethod)shippingMethod
{
  return (PKShippingMethod *)self->_object;
}

- (PKPayment)payment
{
  return (PKPayment *)self->_object;
}

- (PKServiceProviderPurchase)purchase
{
  return (PKServiceProviderPurchase *)self->_object;
}

- (PKAuthorizedPeerPaymentQuote)authorizedPeerPaymentQuote
{
  return (PKAuthorizedPeerPaymentQuote *)self->_object;
}

- (PKApplePayTrustSignature)applePayTrustSignature
{
  return (PKApplePayTrustSignature *)self->_object;
}

- (PKAccountServicePaymentMethod)accountServicePaymentMethod
{
  return (PKAccountServicePaymentMethod *)self->_object;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t kind = self->_kind;
  if (kind > 0xA) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E56F03B0[kind];
  }
  return (id)[v3 stringWithFormat:@"<%@: %p; kind: %@; object: %@>", v4, self, v6, self->_object];
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_unint64_t kind = a3;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end