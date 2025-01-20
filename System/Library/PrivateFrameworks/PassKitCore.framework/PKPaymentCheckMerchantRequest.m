@interface PKPaymentCheckMerchantRequest
- (NSString)domainName;
- (NSString)merchantIdentifier;
- (PKPaymentCheckMerchantRequest)initWithMerchantIdentifier:(id)a3 domainName:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
@end

@implementation PKPaymentCheckMerchantRequest

- (PKPaymentCheckMerchantRequest)initWithMerchantIdentifier:(id)a3 domainName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentCheckMerchantRequest;
  v8 = [(PKOverlayableWebServiceRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    merchantIdentifier = v8->_merchantIdentifier;
    v8->_merchantIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    domainName = v8->_domainName;
    v8->_domainName = (NSString *)v11;
  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  merchantIdentifier = self->_merchantIdentifier;
  id v5 = a3;
  id v6 = [(NSString *)merchantIdentifier dataUsingEncoding:4];
  id v7 = [v6 SHA256Hash];
  v8 = [v7 hexEncoding];
  uint64_t v9 = [v8 uppercaseString];

  v16[0] = @"checkStatus";
  v16[1] = @"merchant";
  v16[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  uint64_t v11 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v10 queryParameters:0 appleAccountInformation:0];

  [v11 setHTTPMethod:@"POST"];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  [v12 setObject:self->_domainName forKey:@"domainName"];
  v13 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v12];
  [v11 setHTTPBody:v13];

  objc_super v14 = (void *)[v11 copy];
  return v14;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end