@interface PKPaymentAugmentSessionRequest
+ (id)augmentSessionRequestWithBaseRequest:(id)a3;
- (PKPaymentMerchantSession)merchantSession;
- (id)bodyDictionary;
- (id)endpointComponents;
- (void)setMerchantSession:(id)a3;
@end

@implementation PKPaymentAugmentSessionRequest

+ (id)augmentSessionRequestWithBaseRequest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentAugmentSessionRequest);
  -[PKPaymentAugmentBaseRequest setType:](v4, "setType:", [v3 type]);
  v5 = [v3 pass];
  [(PKPaymentAugmentBaseRequest *)v4 setPass:v5];

  v6 = [v3 paymentApplication];
  [(PKPaymentAugmentBaseRequest *)v4 setPaymentApplication:v6];

  v7 = [v3 applet];
  [(PKPaymentAugmentBaseRequest *)v4 setApplet:v7];

  v8 = [v3 merchantCountryCode];
  [(PKPaymentAugmentBaseRequest *)v4 setMerchantCountryCode:v8];

  v9 = [v3 currencyCode];
  [(PKPaymentAugmentBaseRequest *)v4 setCurrencyCode:v9];

  v10 = [v3 boundInterfaceIdentifier];

  [(PKWebServiceRequest *)v4 setBoundInterfaceIdentifier:v10];
  return v4;
}

- (id)endpointComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"augmentSession"];
  if ([(PKPaymentAugmentBaseRequest *)self type] == 1) {
    [v3 addObject:@"payLater"];
  }
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)bodyDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PKPaymentMerchantSession *)self->_merchantSession merchantIdentifier];
  [v3 setObject:v4 forKey:@"merchantId"];

  v5 = [(PKPaymentMerchantSession *)self->_merchantSession merchantSessionIdentifier];
  [v3 setObject:v5 forKey:@"merchantSessionId"];

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAugmentSessionRequest;
  v6 = [(PKPaymentAugmentBaseRequest *)&v9 bodyDictionary];
  [v3 addEntriesFromDictionary:v6];

  v7 = (void *)[v3 copy];
  return v7;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end