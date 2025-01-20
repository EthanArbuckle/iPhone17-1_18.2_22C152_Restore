@interface PKPaymentDevicePassesRequest
- (NSString)updatedSince;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setUpdatedSince:(id)a3;
@end

@implementation PKPaymentDevicePassesRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19[0] = @"passes";
  v19[1] = @"devices";
  v19[2] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  updatedSince = self->_updatedSince;
  if (updatedSince)
  {
    v17 = @"passesUpdatedSince";
    v18 = updatedSince;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v14 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v8 endpointComponents:v11 queryParameters:v13 appleAccountInformation:v10];
  }
  else
  {
    v14 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v8 endpointComponents:v11 queryParameters:0 appleAccountInformation:v10];
  }

  [v14 setHTTPMethod:@"GET"];
  v15 = (void *)[v14 copy];

  return v15;
}

- (NSString)updatedSince
{
  return self->_updatedSince;
}

- (void)setUpdatedSince:(id)a3
{
}

- (void).cxx_destruct
{
}

@end