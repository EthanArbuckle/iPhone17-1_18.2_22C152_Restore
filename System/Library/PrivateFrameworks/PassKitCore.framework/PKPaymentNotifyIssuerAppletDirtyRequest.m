@interface PKPaymentNotifyIssuerAppletDirtyRequest
- (PKPaymentNotifyIssuerAppletDirtyRequest)initWithPassSerialNumber:(id)a3 deviceAccountIdentifier:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKPaymentNotifyIssuerAppletDirtyRequest

- (PKPaymentNotifyIssuerAppletDirtyRequest)initWithPassSerialNumber:(id)a3 deviceAccountIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentNotifyIssuerAppletDirtyRequest;
  v9 = [(PKOverlayableWebServiceRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passSerialNumber, a3);
    objc_storeStrong((id *)&v10->_deviceAccountIdentifier, a4);
  }

  return v10;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v23[0] = @"devices";
  v23[1] = a4;
  passSerialNumber = self->_passSerialNumber;
  v23[2] = @"passes";
  v23[3] = passSerialNumber;
  v23[4] = @"notifyIssuerAppletStateDirty";
  v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 arrayWithObjects:v23 count:5];
  v14 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v12 endpointComponents:v13 queryParameters:0 appleAccountInformation:v10];

  [v14 setHTTPMethod:@"POST"];
  [v14 setCachePolicy:1];
  [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v15 = objc_opt_class();
  deviceAccountIdentifier = self->_deviceAccountIdentifier;
  v21 = @"dpanIdentifier";
  v22 = deviceAccountIdentifier;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  v18 = [v15 _HTTPBodyWithDictionary:v17];
  [v14 setHTTPBody:v18];

  v19 = (void *)[v14 copy];
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
}

@end