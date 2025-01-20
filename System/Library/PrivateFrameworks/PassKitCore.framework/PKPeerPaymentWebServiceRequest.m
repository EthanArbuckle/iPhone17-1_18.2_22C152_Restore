@interface PKPeerPaymentWebServiceRequest
- (PKPeerPaymentWebServiceTargetDeviceProtocol)targetDevice;
- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6;
- (id)_murlRequestWithURL:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setTargetDevice:(id)a3;
@end

@implementation PKPeerPaymentWebServiceRequest

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 URLByAppendingPathComponent:@"v4"];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentWebServiceRequest;
  v14 = [(PKWebServiceRequest *)&v16 _murlRequestWithServiceURL:v13 endpointComponents:v12 queryParameters:v11 appleAccountInformation:v10];

  return v14;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  return 0;
}

- (id)_murlRequestWithURL:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentWebServiceRequest;
  v4 = [(PKWebServiceRequest *)&v12 _murlRequestWithURL:a3];
  targetDevice = self->_targetDevice;
  if (!targetDevice
    || ([(PKPeerPaymentWebServiceTargetDeviceProtocol *)targetDevice bridgedClientInfo],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v4 setValue:v6 forHTTPHeaderField:@"X-Apple-Bridged-Client-Info"],
        v6,
        [(PKPeerPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice secureElementIdentifiers], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = +[PKSecureElement secureElementIdentifiers];
  }
  v8 = [v7 componentsJoinedByString:@","];
  [v4 setValue:v8 forHTTPHeaderField:@"x-apple-seid"];
  if (objc_opt_respondsToSelector())
  {
    v9 = [(PKPeerPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice deviceRegion];
    [v4 setValue:v9 forHTTPHeaderField:@"X-Apple-Device-Region"];
  }
  id v10 = PKRequestFireWireIDHeaderValue();
  if ([v10 length]) {
    [v4 setValue:v10 forHTTPHeaderField:@"x-firewire-id"];
  }

  return v4;
}

- (PKPeerPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end