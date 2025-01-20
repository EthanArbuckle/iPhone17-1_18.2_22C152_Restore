@interface PKAccountWebServicePaginatedRequest
- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6;
@end

@implementation PKAccountWebServicePaginatedRequest

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  return [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 version:@"1" endpointComponents:a4 queryParameters:a5 appleAccountInformation:a6];
}

@end