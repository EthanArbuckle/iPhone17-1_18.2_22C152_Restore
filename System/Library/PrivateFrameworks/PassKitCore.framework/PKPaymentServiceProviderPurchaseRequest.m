@interface PKPaymentServiceProviderPurchaseRequest
- (NSString)purchaseIdentifier;
- (PKPaymentServiceProviderPurchaseRequest)initWithPurchaseIdentifier:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setPurchaseIdentifier:(id)a3;
@end

@implementation PKPaymentServiceProviderPurchaseRequest

- (PKPaymentServiceProviderPurchaseRequest)initWithPurchaseIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentServiceProviderPurchaseRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    purchaseIdentifier = v5->_purchaseIdentifier;
    v5->_purchaseIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  purchaseIdentifier = self->_purchaseIdentifier;
  v14[0] = @"purchase";
  v14[1] = purchaseIdentifier;
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v14 count:2];
  v11 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v9 endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

  [v11 setHTTPMethod:@"POST"];
  v12 = (void *)[v11 copy];

  return v12;
}

- (NSString)purchaseIdentifier
{
  return self->_purchaseIdentifier;
}

- (void)setPurchaseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end