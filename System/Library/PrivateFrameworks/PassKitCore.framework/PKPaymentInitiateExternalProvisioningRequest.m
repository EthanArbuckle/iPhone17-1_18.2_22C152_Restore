@interface PKPaymentInitiateExternalProvisioningRequest
- (NSArray)externalDestinationDevices;
- (NSString)cardIdentifier;
- (NSString)region;
- (PKPaymentInitiateExternalProvisioningRequestDPANAuthorization)authorization;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setAuthorization:(id)a3;
- (void)setCardIdentifier:(id)a3;
- (void)setExternalDestinationDevices:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation PKPaymentInitiateExternalProvisioningRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v20 = @"devices";
  id v21 = a4;
  cardIdentifier = self->_cardIdentifier;
  v22 = @"cards";
  v23 = cardIdentifier;
  v24 = @"initiateExternalProvisioning";
  v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 arrayWithObjects:&v20 count:5];
  v14 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v12, @"2", v13, 0, v10, v20, v21, v22, v23, v24, v25 version endpointComponents queryParameters appleAccountInformation];

  [v14 setHTTPMethod:@"POST"];
  [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v15 setObject:self->_externalDestinationDevices forKeyedSubscript:@"deviceSerialNumbers"];
  v16 = [(PKPaymentInitiateExternalProvisioningRequestDPANAuthorization *)self->_authorization dictionaryRepresentation];

  [v15 setObject:v16 forKeyedSubscript:@"authorization"];
  v17 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v15];
  [v14 setHTTPBody:v17];

  v18 = (void *)[v14 copy];
  return v18;
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (void)setCardIdentifier:(id)a3
{
}

- (NSArray)externalDestinationDevices
{
  return self->_externalDestinationDevices;
}

- (void)setExternalDestinationDevices:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (PKPaymentInitiateExternalProvisioningRequestDPANAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_externalDestinationDevices, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

@end