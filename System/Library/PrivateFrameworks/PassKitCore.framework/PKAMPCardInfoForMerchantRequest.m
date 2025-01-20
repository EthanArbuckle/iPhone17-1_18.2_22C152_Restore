@interface PKAMPCardInfoForMerchantRequest
- (NSString)merchantIdentifier;
- (PKAMPCardInfoForMerchantRequest)initWithMerchantIdentifier:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setMerchantIdentifier:(id)a3;
@end

@implementation PKAMPCardInfoForMerchantRequest

- (PKAMPCardInfoForMerchantRequest)initWithMerchantIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAMPCardInfoForMerchantRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17 = @"devices";
  id v18 = a4;
  merchantIdentifier = self->_merchantIdentifier;
  v19 = @"merchant";
  v20 = merchantIdentifier;
  v21 = @"cardInfo";
  objc_super v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 arrayWithObjects:&v17 count:5];

  v14 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v12, v13, 0, v10, v17, v18, v19, v20, v21, v22);

  [v14 setHTTPMethod:@"GET"];
  [v14 setCachePolicy:1];
  v15 = (void *)[v14 copy];

  return v15;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end