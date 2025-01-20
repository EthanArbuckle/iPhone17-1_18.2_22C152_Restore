@interface PKPaymentProvisionPrecursorPassRequest
- (PKPaymentProvisionPrecursorPassRequest)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4 actions:(id)a5;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKPaymentProvisionPrecursorPassRequest

- (PKPaymentProvisionPrecursorPassRequest)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4 actions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentProvisionPrecursorPassRequest;
  v12 = [(PKOverlayableWebServiceRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_passTypeIdentifier, a3);
    objc_storeStrong((id *)&v13->_passSerialNumber, a4);
    objc_storeStrong((id *)&v13->_actions, a5);
  }

  return v13;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19 = @"devices";
  id v20 = a4;
  v21 = @"getPrecursorPass";
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:&v19 count:3];
  v13 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11, @"1", v12, 0, v9, v19, v20, v21, v22 version endpointComponents queryParameters appleAccountInformation];

  [v13 setHTTPMethod:@"POST"];
  [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v14 setObject:self->_passTypeIdentifier forKeyedSubscript:@"passTypeIdentifier"];
  [v14 setObject:self->_passSerialNumber forKeyedSubscript:@"serialNumber"];
  objc_super v15 = [(NSArray *)self->_actions pk_arrayByApplyingBlock:&__block_literal_global_2582];

  [v14 setObject:v15 forKeyedSubscript:@"actions"];
  v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v14];
  [v13 setHTTPBody:v16];

  v17 = (void *)[v13 copy];
  return v17;
}

uint64_t __109__PKPaymentProvisionPrecursorPassRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asDictionary];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end