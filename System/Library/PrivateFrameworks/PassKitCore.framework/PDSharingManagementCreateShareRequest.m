@interface PDSharingManagementCreateShareRequest
- (NSArray)sharedEntitlements;
- (NSData)fidoSignedChallenge;
- (NSData)shareData;
- (NSDictionary)encryptedShareData;
- (NSString)dpanIdentifier;
- (NSString)recipient;
- (NSString)verificationCode;
- (id)requestBody;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setEncryptedShareData:(id)a3;
- (void)setFidoSignedChallenge:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setSharedEntitlements:(id)a3;
- (void)setVerificationCode:(id)a3;
@end

@implementation PDSharingManagementCreateShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v14[0] = @"sharing";
  v14[1] = @"share";
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:v14 count:2];
  v9 = [(PDSharingManagementCreateShareRequest *)self _murlRequestWithServiceURL:v7 endpointComponents:v8 queryParameters:0 appleAccountInformation:v6];

  [v9 setHTTPMethod:@"POST"];
  v10 = [(PDSharingManagementCreateShareRequest *)self requestBody];
  v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
  [v9 setHTTPBody:v11];

  id v12 = [v9 copy];
  return v12;
}

- (NSData)shareData
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:self->_recipient forKeyedSubscript:@"recipient"];
  v4 = [(NSArray *)self->_sharedEntitlements pk_arrayByApplyingBlock:&stru_100754440];
  [v3 setObject:v4 forKeyedSubscript:@"sharedEntitlements"];

  [v3 setObject:self->_verificationCode forKeyedSubscript:@"verificationCode"];
  uint64_t v7 = 0;
  v5 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:&v7];

  return (NSData *)v5;
}

- (id)requestBody
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:self->_dpanIdentifier forKeyedSubscript:@"dpanIdentifier"];
  v4 = [(NSData *)self->_fidoSignedChallenge base64EncodedStringWithOptions:0];
  [v3 setObject:v4 forKeyedSubscript:@"fidoSignedChallenge"];

  [v3 setObject:self->_encryptedShareData forKeyedSubscript:@"encryptedShareData"];
  return v3;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (NSData)fidoSignedChallenge
{
  return self->_fidoSignedChallenge;
}

- (void)setFidoSignedChallenge:(id)a3
{
}

- (NSString)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (NSArray)sharedEntitlements
{
  return self->_sharedEntitlements;
}

- (void)setSharedEntitlements:(id)a3
{
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (NSDictionary)encryptedShareData
{
  return self->_encryptedShareData;
}

- (void)setEncryptedShareData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedShareData, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_sharedEntitlements, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_fidoSignedChallenge, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end