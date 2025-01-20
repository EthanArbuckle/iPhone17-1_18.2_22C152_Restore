@interface PKPaymentIssuerProvisioningCertificatesRequest
- (PKPaymentIssuerProvisioningCertificatesRequest)init;
- (PKPaymentIssuerProvisioningCertificatesRequest)initWithEncryptionScheme:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKPaymentIssuerProvisioningCertificatesRequest

- (PKPaymentIssuerProvisioningCertificatesRequest)init
{
  return 0;
}

- (PKPaymentIssuerProvisioningCertificatesRequest)initWithEncryptionScheme:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentIssuerProvisioningCertificatesRequest;
    v5 = [(PKOverlayableWebServiceRequest *)&v9 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      encryptionScheme = v5->_encryptionScheme;
      v5->_encryptionScheme = (NSString *)v6;
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v20[0] = @"devices";
  v20[1] = a4;
  v20[2] = @"issuerProvisioningCertificates";
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:v20 count:3];
  encryptionScheme = self->_encryptionScheme;
  v18 = @"encryptionVersion";
  v19 = encryptionScheme;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  v15 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11 endpointComponents:v12 queryParameters:v14 appleAccountInformation:v9];

  [v15 setHTTPMethod:@"GET"];
  [v15 setCachePolicy:1];
  v16 = (void *)[v15 copy];

  return v16;
}

- (void).cxx_destruct
{
}

@end