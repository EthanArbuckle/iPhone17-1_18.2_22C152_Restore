@interface PKPaymentRemotePassesRequest
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
@end

@implementation PKPaymentRemotePassesRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v4 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 endpointComponents:&unk_1EE22B1E0 queryParameters:0 appleAccountInformation:a4];
  [v4 setHTTPMethod:@"GET"];
  v5 = (void *)[v4 copy];

  return v5;
}

@end