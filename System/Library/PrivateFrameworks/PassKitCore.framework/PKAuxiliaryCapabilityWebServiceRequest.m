@interface PKAuxiliaryCapabilityWebServiceRequest
- (PKAuxiliaryCapabilityWebServiceRequest)init;
- (PKAuxiliaryCapabilityWebServiceRequest)initWithPass:(id)a3;
- (PKSecureElementPass)pass;
- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6;
- (void)setPass:(id)a3;
@end

@implementation PKAuxiliaryCapabilityWebServiceRequest

- (PKAuxiliaryCapabilityWebServiceRequest)init
{
  return [(PKAuxiliaryCapabilityWebServiceRequest *)self initWithPass:0];
}

- (PKAuxiliaryCapabilityWebServiceRequest)initWithPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAuxiliaryCapabilityWebServiceRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  return [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 version:@"4" endpointComponents:a4 queryParameters:a5 appleAccountInformation:a6];
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (void).cxx_destruct
{
}

@end