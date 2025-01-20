@interface PKContactInformationRequest
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKContactInformationRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v5 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 endpointComponents:&unk_1EE22B210 queryParameters:0 appleAccountInformation:a5];
  [v5 setHTTPMethod:@"GET"];
  v6 = (void *)[v5 copy];

  return v6;
}

@end