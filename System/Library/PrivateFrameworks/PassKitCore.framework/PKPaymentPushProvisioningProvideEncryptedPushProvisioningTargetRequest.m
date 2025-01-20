@interface PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest
- (NSString)sharingInstanceIdentifier;
- (PKEncryptedPushProvisioningTarget)encryptedPushProvisioningTarget;
- (PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest)initWithEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (id)requestBody;
- (void)setEncryptedPushProvisioningTarget:(id)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
@end

@implementation PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest

- (PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest)initWithEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest;
  v9 = [(PKOverlayableWebServiceRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptedPushProvisioningTarget, a3);
    objc_storeStrong((id *)&v10->_sharingInstanceIdentifier, a4);
  }

  return v10;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19 = @"devices";
  id v20 = a4;
  v21 = @"pushProvisioningTarget";
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_super v12 = [v8 arrayWithObjects:&v19 count:3];

  v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v19, v20, v21, v22);

  [v13 setHTTPMethod:@"POST"];
  v14 = objc_opt_class();
  v15 = [(PKPaymentPushProvisioningProvideEncryptedPushProvisioningTargetRequest *)self requestBody];
  v16 = [v14 _HTTPBodyWithDictionary:v15];
  [v13 setHTTPBody:v16];

  v17 = (void *)[v13 copy];
  return v17;
}

- (id)requestBody
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v4 = [(PKEncryptedPushProvisioningTarget *)self->_encryptedPushProvisioningTarget asWebServiceDictionary];
  v5 = (void *)[v3 initWithDictionary:v4];

  [v5 setObject:self->_sharingInstanceIdentifier forKeyedSubscript:@"sharingInstanceIdentifier"];
  v6 = (void *)[v5 copy];

  return v6;
}

- (PKEncryptedPushProvisioningTarget)encryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget;
}

- (void)setEncryptedPushProvisioningTarget:(id)a3
{
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptedPushProvisioningTarget, 0);
}

@end