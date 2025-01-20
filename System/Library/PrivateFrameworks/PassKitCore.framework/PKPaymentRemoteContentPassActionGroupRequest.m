@interface PKPaymentRemoteContentPassActionGroupRequest
- (PKPaymentPassActionGroup)actionGroup;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 passTypeIdentifier:(id)a5 passSerialNumber:(id)a6 appleAccountInformation:(id)a7;
- (void)setActionGroup:(id)a3;
@end

@implementation PKPaymentRemoteContentPassActionGroupRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 passTypeIdentifier:(id)a5 passSerialNumber:(id)a6 appleAccountInformation:(id)a7
{
  v28[7] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  actionGroup = self->_actionGroup;
  id v16 = a7;
  id v17 = a3;
  v18 = [(PKPaymentPassActionGroup *)actionGroup appletData];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v20 = v19;
  if (v18) {
    [v19 setObject:v18 forKey:@"appletData"];
  }
  v28[0] = @"devices";
  v28[1] = v12;
  v28[2] = @"passes";
  v28[3] = v13;
  v28[4] = v14;
  v28[5] = @"actionGroup";
  v21 = [(PKPaymentPassActionGroup *)self->_actionGroup identifier];
  v28[6] = v21;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:7];
  v22 = v27 = v12;
  v23 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v17 endpointComponents:v22 queryParameters:0 appleAccountInformation:v16];

  v24 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v20];
  [v23 setHTTPBody:v24];

  [v23 setHTTPMethod:@"POST"];
  v25 = (void *)[v23 copy];

  return v25;
}

- (PKPaymentPassActionGroup)actionGroup
{
  return self->_actionGroup;
}

- (void)setActionGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end