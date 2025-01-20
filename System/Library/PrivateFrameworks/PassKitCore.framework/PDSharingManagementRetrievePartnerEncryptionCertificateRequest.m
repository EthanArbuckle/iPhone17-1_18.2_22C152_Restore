@interface PDSharingManagementRetrievePartnerEncryptionCertificateRequest
- (NSString)passSerialNumber;
- (id)urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setPassSerialNumber:(id)a3;
@end

@implementation PDSharingManagementRetrievePartnerEncryptionCertificateRequest

- (id)urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v19[0] = @"devices";
  v19[1] = a4;
  v19[2] = @"passes";
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PDSharingManagementRequest *)self regionIdentifier];
  passSerialNumber = self->_passSerialNumber;
  v19[3] = v11;
  v19[4] = passSerialNumber;
  v19[5] = @"partnerEncryptionCertificate";
  v13 = +[NSArray arrayWithObjects:v19 count:6];

  v14 = [(PDSharingManagementRetrievePartnerEncryptionCertificateRequest *)self _murlRequestWithServiceURL:v10 endpointComponents:v13 queryParameters:0 appleAccountInformation:v8];

  [v14 setHTTPMethod:@"POST"];
  [v14 setCachePolicy:0];
  id v15 = objc_alloc_init((Class)NSMutableDictionary);

  v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v15];
  [v14 setHTTPBody:v16];

  id v17 = [v14 copy];
  return v17;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end