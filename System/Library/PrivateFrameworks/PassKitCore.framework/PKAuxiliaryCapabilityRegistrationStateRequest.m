@interface PKAuxiliaryCapabilityRegistrationStateRequest
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKAuxiliaryCapabilityRegistrationStateRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15 = @"devices";
  id v16 = a4;
  v17 = @"registrationState";
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:&v15 count:3];

  v13 = -[PKAuxiliaryCapabilityWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v15, v16, v17, v18);

  [v13 setHTTPMethod:@"GET"];
  return v13;
}

@end