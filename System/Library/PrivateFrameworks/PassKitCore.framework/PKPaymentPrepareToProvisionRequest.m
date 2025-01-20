@interface PKPaymentPrepareToProvisionRequest
- (PKPaymentPrepareToProvisionRequest)initWithCredentials:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKPaymentPrepareToProvisionRequest

- (PKPaymentPrepareToProvisionRequest)initWithCredentials:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentPrepareToProvisionRequest;
    v6 = [(PKOverlayableWebServiceRequest *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_credentials, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v19 = @"devices";
  id v20 = v8;
  v21 = @"prepareForProvisionings";
  v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 arrayWithObjects:&v19 count:3];
  v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v10, v19, v20, v21, v22);

  [v13 setHTTPMethod:@"POST"];
  [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v14 = [(NSArray *)self->_credentials pk_arrayBySafelyApplyingBlock:&__block_literal_global_2565];
  if ([v14 count])
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v15 setObject:v14 forKeyedSubscript:@"cards"];
    v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v15];
    [v13 setHTTPBody:v16];

    v17 = (void *)[v13 copy];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __105__PKPaymentPrepareToProvisionRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isRemoteCredential])
  {
    v3 = [v2 remoteCredential];
    v4 = [v3 serialNumber];
    id v5 = [v3 paymentPass];
    v6 = [v5 passTypeIdentifier];

    id v7 = 0;
    if (v4 && v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = [v3 identifier];
      [v7 setObject:v8 forKeyedSubscript:@"identifier"];

      [v7 setObject:v4 forKeyedSubscript:@"passSerialNumber"];
      [v7 setObject:v6 forKeyedSubscript:@"passTypeIdentifier"];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end