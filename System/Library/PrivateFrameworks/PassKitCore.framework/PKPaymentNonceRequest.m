@interface PKPaymentNonceRequest
+ (id)nonceRequestWithBaseRequest:(id)a3;
- (BOOL)useLegacyGetAPI;
- (NSString)merchantIdentifier;
- (id)_legacyGetURLRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (id)bodyDictionary;
- (id)endpointComponents;
- (void)setMerchantIdentifier:(id)a3;
- (void)setUseLegacyGetAPI:(BOOL)a3;
@end

@implementation PKPaymentNonceRequest

- (id)_legacyGetURLRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PKPaymentAugmentBaseRequest *)self pass];
  v12 = [v11 passTypeIdentifier];
  v13 = [v11 serialNumber];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"devices", v9, 0);

  if (![(PKPaymentAugmentBaseRequest *)self type])
  {
    [v14 addObject:@"passes"];
    [v14 addObject:v12];
    [v14 addObject:v13];
  }
  v15 = [(PKPaymentNonceRequest *)self endpointComponents];
  if ([v15 count]) {
    [v14 addObjectsFromArray:v15];
  }
  v16 = (void *)[v14 copy];
  v17 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v10 endpointComponents:v16 queryParameters:0 appleAccountInformation:v8];

  [v17 setHTTPMethod:@"GET"];
  v18 = (void *)[v17 copy];

  return v18;
}

+ (id)nonceRequestWithBaseRequest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentNonceRequest);
  -[PKPaymentAugmentBaseRequest setType:](v4, "setType:", [v3 type]);
  v5 = [v3 pass];
  [(PKPaymentAugmentBaseRequest *)v4 setPass:v5];

  v6 = [v3 paymentApplication];
  [(PKPaymentAugmentBaseRequest *)v4 setPaymentApplication:v6];

  v7 = [v3 applet];
  [(PKPaymentAugmentBaseRequest *)v4 setApplet:v7];

  id v8 = [v3 merchantCountryCode];
  [(PKPaymentAugmentBaseRequest *)v4 setMerchantCountryCode:v8];

  id v9 = [v3 currencyCode];
  [(PKPaymentAugmentBaseRequest *)v4 setCurrencyCode:v9];

  id v10 = [v3 boundInterfaceIdentifier];

  [(PKWebServiceRequest *)v4 setBoundInterfaceIdentifier:v10];
  return v4;
}

- (id)endpointComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"nOnce"];
  if ([(PKPaymentAugmentBaseRequest *)self type] == 1) {
    [v3 addObject:@"payLater"];
  }
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)bodyDictionary
{
  id v3 = [(NSString *)self->_merchantIdentifier dataUsingEncoding:4];
  v4 = [v3 SHA256Hash];
  v5 = [v4 hexEncoding];

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setValue:v5 forKey:@"merchantId"];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentNonceRequest;
  v7 = [(PKPaymentAugmentBaseRequest *)&v10 bodyDictionary];
  [v6 addEntriesFromDictionary:v7];

  id v8 = (void *)[v6 copy];
  return v8;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (BOOL)useLegacyGetAPI
{
  return self->_useLegacyGetAPI;
}

- (void)setUseLegacyGetAPI:(BOOL)a3
{
  self->_useLegacyGetAPI = a3;
}

- (void).cxx_destruct
{
}

@end