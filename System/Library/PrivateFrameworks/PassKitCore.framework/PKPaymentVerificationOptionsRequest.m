@interface PKPaymentVerificationOptionsRequest
+ (id)requestWithPass:(id)a3;
- (NSString)stepIdentifier;
- (PKPaymentPass)pass;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setPass:(id)a3;
- (void)setStepIdentifier:(id)a3;
@end

@implementation PKPaymentVerificationOptionsRequest

+ (id)requestWithPass:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentVerificationOptionsRequest);
  [(PKPaymentVerificationOptionsRequest *)v4 setPass:v3];

  return v4;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v20[6] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 dictionary];
  v13 = v12;
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier) {
    [v12 setObject:stepIdentifier forKey:@"stepIdentifier"];
  }
  v20[0] = @"devices";
  v20[1] = v8;
  v20[2] = @"passes";
  v15 = [(PKPass *)self->_pass passTypeIdentifier];
  v20[3] = v15;
  v16 = [(PKPass *)self->_pass serialNumber];
  v20[4] = v16;
  v20[5] = @"activation";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:6];
  v18 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11 endpointComponents:v17 queryParameters:v13 appleAccountInformation:v10];

  [v18 setHTTPMethod:@"GET"];
  return v18;
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
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
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
}

@end