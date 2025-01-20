@interface PKPaymentRemoteCredentialsRequest
- (BOOL)excludeDeviceInfo;
- (BOOL)includeMetadata;
- (NSString)productIdentifier;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (int64_t)credentialType;
- (void)setCredentialType:(int64_t)a3;
- (void)setExcludeDeviceInfo:(BOOL)a3;
- (void)setIncludeMetadata:(BOOL)a3;
- (void)setProductIdentifier:(id)a3;
@end

@implementation PKPaymentRemoteCredentialsRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 dictionary];
  v13 = v12;
  if (self->_includeMetadata) {
    [v12 setObject:@"true" forKey:@"includeMetadata"];
  }
  if (self->_excludeDeviceInfo) {
    [v13 setObject:@"true" forKey:@"excludeDeviceInfo"];
  }
  productIdentifier = self->_productIdentifier;
  if (productIdentifier) {
    [v13 setObject:productIdentifier forKey:@"productIdentifier"];
  }
  if (self->_credentialType)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_credentialType);
    [v13 setObject:v15 forKey:@"cardType"];
  }
  v20[0] = @"devices";
  v20[1] = v8;
  v20[2] = @"cards";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v17 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11 endpointComponents:v16 queryParameters:v13 appleAccountInformation:v10];

  [v17 setHTTPMethod:@"GET"];
  v18 = (void *)[v17 copy];

  return v18;
}

- (BOOL)includeMetadata
{
  return self->_includeMetadata;
}

- (void)setIncludeMetadata:(BOOL)a3
{
  self->_includeMetadata = a3;
}

- (BOOL)excludeDeviceInfo
{
  return self->_excludeDeviceInfo;
}

- (void)setExcludeDeviceInfo:(BOOL)a3
{
  self->_excludeDeviceInfo = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (void).cxx_destruct
{
}

@end