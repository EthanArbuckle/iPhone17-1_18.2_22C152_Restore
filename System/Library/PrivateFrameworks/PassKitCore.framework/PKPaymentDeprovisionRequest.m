@interface PKPaymentDeprovisionRequest
- (PKPaymentDeprovisionRequest)initWithPaymentPass:(id)a3;
- (PKPaymentPass)pass;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setPass:(id)a3;
@end

@implementation PKPaymentDeprovisionRequest

- (PKPaymentDeprovisionRequest)initWithPaymentPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentDeprovisionRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v18[0] = @"passes";
  pass = self->_pass;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(PKPass *)pass passTypeIdentifier];
  v18[1] = v12;
  v13 = [(PKPass *)self->_pass serialNumber];
  v18[2] = v13;
  v18[3] = @"devices";
  v18[4] = v10;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];

  v15 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11 endpointComponents:v14 queryParameters:0 appleAccountInformation:v9];

  [v15 setHTTPMethod:@"DELETE"];
  v16 = (void *)[v15 copy];

  return v16;
}

- (PKPaymentPass)pass
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