@interface PKVPANPaymentSessionRequest
- (NSString)deviceIdentifier;
- (PKVPANPaymentSessionRequest)initWithDeviceIdentifier:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
@end

@implementation PKVPANPaymentSessionRequest

- (PKVPANPaymentSessionRequest)initWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKVPANPaymentSessionRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  deviceIdentifier = self->_deviceIdentifier;
  v13 = @"devices";
  v14 = deviceIdentifier;
  v15 = @"virtualCardPaymentSession";
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:&v13 count:3];
  v11 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v9, @"1", v10, 0, v8, v13, v14, v15, v16 version endpointComponents queryParameters appleAccountInformation];

  [v11 setHTTPMethod:@"POST"];
  return v11;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
}

@end