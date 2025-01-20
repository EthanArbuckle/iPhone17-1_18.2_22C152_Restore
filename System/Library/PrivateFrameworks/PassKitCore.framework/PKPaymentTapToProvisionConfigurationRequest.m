@interface PKPaymentTapToProvisionConfigurationRequest
- (PKPaymentTapToProvisionConfigurationRequest)init;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKPaymentTapToProvisionConfigurationRequest

- (PKPaymentTapToProvisionConfigurationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTapToProvisionConfigurationRequest;
  return [(PKOverlayableWebServiceRequest *)&v3 init];
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16 = @"devices";
  id v17 = a4;
  v18 = @"tapToProvisionConfiguration";
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:&v16 count:3];

  v13 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11, @"4", v12, 0, v9, v16, v17, v18, v19 version endpointComponents queryParameters appleAccountInformation];

  [v13 setHTTPMethod:@"GET"];
  v14 = (void *)[v13 copy];

  return v14;
}

@end