@interface PKPaymentServiceProviderPerformActionRequest
- (NSString)action;
- (PKPaymentServiceProviderPerformActionRequest)initWithAction:(id)a3 purchase:(id)a4;
- (PKServiceProviderPurchase)purchase;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setAction:(id)a3;
- (void)setPurchase:(id)a3;
@end

@implementation PKPaymentServiceProviderPerformActionRequest

- (PKPaymentServiceProviderPerformActionRequest)initWithAction:(id)a3 purchase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentServiceProviderPerformActionRequest;
  v8 = [(PKOverlayableWebServiceRequest *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    action = v8->_action;
    v8->_action = (NSString *)v9;

    objc_storeStrong((id *)&v8->_purchase, a4);
  }

  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"purchase";
  purchase = self->_purchase;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(PKServiceProviderPurchase *)purchase identifier];
  v14[1] = v9;
  v14[2] = @"action";
  v14[3] = self->_action;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  v11 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v8 endpointComponents:v10 queryParameters:0 appleAccountInformation:v7];

  [v11 setHTTPMethod:@"POST"];
  objc_super v12 = (void *)[v11 copy];

  return v12;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end