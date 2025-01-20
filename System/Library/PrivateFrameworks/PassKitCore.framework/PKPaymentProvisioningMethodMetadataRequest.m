@interface PKPaymentProvisioningMethodMetadataRequest
- (NSString)productIdentifier;
- (NSString)provisioningMethod;
- (PKPaymentProvisioningMethodMetadataRequest)initWithProductIdentifier:(id)a3 provisioningMethod:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setProductIdentifier:(id)a3;
- (void)setProvisioningMethod:(id)a3;
@end

@implementation PKPaymentProvisioningMethodMetadataRequest

- (PKPaymentProvisioningMethodMetadataRequest)initWithProductIdentifier:(id)a3 provisioningMethod:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentProvisioningMethodMetadataRequest;
  v8 = [(PKOverlayableWebServiceRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    productIdentifier = v8->_productIdentifier;
    v8->_productIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    provisioningMethod = v8->_provisioningMethod;
    v8->_provisioningMethod = (NSString *)v11;
  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v17[6] = *MEMORY[0x1E4F143B8];
  v17[0] = @"devices";
  v17[1] = a4;
  productIdentifier = self->_productIdentifier;
  v17[2] = @"products";
  v17[3] = productIdentifier;
  v17[4] = self->_provisioningMethod;
  v17[5] = @"provisioningMethod";
  uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 arrayWithObjects:v17 count:6];

  objc_super v14 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v12 endpointComponents:v13 queryParameters:0 appleAccountInformation:v10];

  [v14 setHTTPMethod:@"GET"];
  v15 = (void *)[v14 copy];

  return v15;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)provisioningMethod
{
  return self->_provisioningMethod;
}

- (void)setProvisioningMethod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningMethod, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
}

@end