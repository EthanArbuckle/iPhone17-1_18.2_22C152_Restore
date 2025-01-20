@interface PKSubcredentialProvisioningLocalDeviceConfiguration
- (PKCredentialRegistrationMetadata)registrationMetadata;
- (PKPaymentWebService)webService;
- (PKSubcredentialProvisioningLocalDeviceConfiguration)initWithWebService:(id)a3 registrationMetadata:(id)a4 configurationType:(int64_t)a5;
@end

@implementation PKSubcredentialProvisioningLocalDeviceConfiguration

- (PKSubcredentialProvisioningLocalDeviceConfiguration)initWithWebService:(id)a3 registrationMetadata:(id)a4 configurationType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(PKSubcredentialProvisioningConfiguration *)self initWithConfigurationType:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_webService, a3);
    objc_storeStrong((id *)&v12->_registrationMetadata, a4);
  }

  return v12;
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (PKCredentialRegistrationMetadata)registrationMetadata
{
  return self->_registrationMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationMetadata, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end