@interface PKPaymentServiceProviderPurchasesRequest
- (NSString)actionIdentifier;
- (NSString)countryCode;
- (NSString)productIdentifier;
- (NSString)purchaseState;
- (NSString)serviceProviderIdentifier;
- (NSString)targetDeviceSerialNumber;
- (PKPaymentServiceProviderPurchasesRequest)initWithPurchaseState:(id)a3 serviceProviderIdentifier:(id)a4 productIdentifier:(id)a5 actionIdentifier:(id)a6 serviceProviderCountryCode:(id)a7;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setActionIdentifier:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setPurchaseState:(id)a3;
- (void)setServiceProviderIdentifier:(id)a3;
- (void)setTargetDeviceSerialNumber:(id)a3;
@end

@implementation PKPaymentServiceProviderPurchasesRequest

- (PKPaymentServiceProviderPurchasesRequest)initWithPurchaseState:(id)a3 serviceProviderIdentifier:(id)a4 productIdentifier:(id)a5 actionIdentifier:(id)a6 serviceProviderCountryCode:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentServiceProviderPurchasesRequest;
  v17 = [(PKOverlayableWebServiceRequest *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    purchaseState = v17->_purchaseState;
    v17->_purchaseState = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    serviceProviderIdentifier = v17->_serviceProviderIdentifier;
    v17->_serviceProviderIdentifier = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    productIdentifier = v17->_productIdentifier;
    v17->_productIdentifier = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    actionIdentifier = v17->_actionIdentifier;
    v17->_actionIdentifier = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    countryCode = v17->_countryCode;
    v17->_countryCode = (NSString *)v26;
  }
  return v17;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a5;
  id v11 = a3;
  id v12 = [v9 dictionary];
  id v13 = v12;
  purchaseState = self->_purchaseState;
  if (purchaseState) {
    [v12 setObject:purchaseState forKey:@"state"];
  }
  serviceProviderIdentifier = self->_serviceProviderIdentifier;
  if (serviceProviderIdentifier) {
    [v13 setObject:serviceProviderIdentifier forKey:@"serviceProviderIdentifier"];
  }
  productIdentifier = self->_productIdentifier;
  if (productIdentifier) {
    [v13 setObject:productIdentifier forKey:@"productIdentifier"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v13 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  targetDeviceSerialNumber = self->_targetDeviceSerialNumber;
  if (targetDeviceSerialNumber)
  {
    uint64_t v26 = @"targetDeviceSerialNumber";
    v27[0] = targetDeviceSerialNumber;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  }
  else
  {
    v19 = 0;
  }
  v25[0] = @"device";
  v25[1] = v8;
  v25[2] = @"purchases";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  v21 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11 endpointComponents:v20 queryParameters:v13 appleAccountInformation:v10];

  uint64_t v22 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v19];
  [v21 setHTTPBody:v22];

  [v21 setHTTPMethod:@"POST"];
  v23 = (void *)[v21 copy];

  return v23;
}

- (NSString)purchaseState
{
  return self->_purchaseState;
}

- (void)setPurchaseState:(id)a3
{
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)targetDeviceSerialNumber
{
  return self->_targetDeviceSerialNumber;
}

- (void)setTargetDeviceSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_purchaseState, 0);
}

@end