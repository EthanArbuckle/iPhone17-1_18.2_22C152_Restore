@interface PKDeleteMerchantTokenRequest
- (NSString)merchantTokenId;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setMerchantTokenId:(id)a3;
@end

@implementation PKDeleteMerchantTokenRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  merchantTokenId = self->_merchantTokenId;
  v13[0] = @"merchantTokens";
  v13[1] = merchantTokenId;
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v13 count:2];
  v11 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v9 version:@"1" endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

  [v11 setHTTPMethod:@"DELETE"];
  return v11;
}

- (NSString)merchantTokenId
{
  return self->_merchantTokenId;
}

- (void)setMerchantTokenId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end