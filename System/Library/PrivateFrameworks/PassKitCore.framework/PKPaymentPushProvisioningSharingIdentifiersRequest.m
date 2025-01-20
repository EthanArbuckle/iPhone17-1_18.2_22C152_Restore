@interface PKPaymentPushProvisioningSharingIdentifiersRequest
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKPaymentPushProvisioningSharingIdentifiersRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16 = @"devices";
  id v17 = a4;
  v18 = @"sharingInstanceIdentifiers";
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:&v16 count:3];

  v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v16, v17, v18, v19);

  [v13 setHTTPMethod:@"GET"];
  [v13 setCachePolicy:1];
  v14 = (void *)[v13 copy];

  return v14;
}

@end