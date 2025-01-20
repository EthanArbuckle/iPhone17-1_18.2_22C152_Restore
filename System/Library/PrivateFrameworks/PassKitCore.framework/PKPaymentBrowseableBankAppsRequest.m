@interface PKPaymentBrowseableBankAppsRequest
- (NSString)region;
- (PKPaymentBrowseableBankAppsRequest)initWithRegion:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setRegion:(id)a3;
@end

@implementation PKPaymentBrowseableBankAppsRequest

- (PKPaymentBrowseableBankAppsRequest)initWithRegion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBrowseableBankAppsRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    region = v5->_region;
    v5->_region = (NSString *)v6;
  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  region = self->_region;
  v19 = @"region";
  v20[0] = region;
  objc_super v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v18[0] = @"devices";
  v18[1] = v11;
  v18[2] = @"partners";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

  v15 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v12 endpointComponents:v14 queryParameters:v13 appleAccountInformation:v10];

  [v15 setHTTPMethod:@"GET"];
  v16 = (void *)[v15 copy];

  return v16;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end