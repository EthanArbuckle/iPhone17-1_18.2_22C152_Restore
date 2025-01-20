@interface PKPaymentUnregisterRequest
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 companionSerialNumber:(id)a5 appleAccountInformation:(id)a6;
@end

@implementation PKPaymentUnregisterRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 companionSerialNumber:(id)a5 appleAccountInformation:(id)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v19[0] = @"devices";
  v19[1] = a4;
  v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [v11 arrayWithObjects:v19 count:2];

  v16 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v14 endpointComponents:v15 queryParameters:0 appleAccountInformation:v12];

  [v16 setHTTPMethod:@"DELETE"];
  [v16 setCachePolicy:1];
  if (v10) {
    [v16 setValue:v10 forHTTPHeaderField:@"X-Companion-Serial-Number"];
  }
  v17 = (void *)[v16 copy];

  return v17;
}

@end