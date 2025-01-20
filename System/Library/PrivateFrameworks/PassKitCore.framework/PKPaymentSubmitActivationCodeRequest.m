@interface PKPaymentSubmitActivationCodeRequest
- (NSData)verificationData;
- (NSString)verificationCode;
- (PKPaymentPass)pass;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setPass:(id)a3;
- (void)setVerificationCode:(id)a3;
- (void)setVerificationData:(id)a3;
@end

@implementation PKPaymentSubmitActivationCodeRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v28[0] = @"devices";
  v28[1] = v8;
  v28[2] = @"passes";
  pass = self->_pass;
  id v10 = a5;
  id v11 = a3;
  v12 = [(PKPass *)pass passTypeIdentifier];
  v28[3] = v12;
  v13 = [(PKPass *)self->_pass serialNumber];
  v28[4] = v13;
  v28[5] = @"activationCode";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];
  v15 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v11 endpointComponents:v14 queryParameters:0 appleAccountInformation:v10];

  [v15 setHTTPMethod:@"POST"];
  [v15 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (self->_verificationCode)
  {
    v16 = objc_opt_class();
    verificationCode = self->_verificationCode;
    v26 = @"activationCode";
    v27 = verificationCode;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v19 = [v16 _HTTPBodyWithDictionary:v18];
    [v15 setHTTPBody:v19];
  }
  else
  {
    v18 = [(NSData *)self->_verificationData base64EncodedStringWithOptions:0];
    v20 = objc_opt_class();
    v24 = @"activationData";
    v25 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v21 = [v20 _HTTPBodyWithDictionary:v19];
    [v15 setHTTPBody:v21];
  }
  v22 = (void *)[v15 copy];

  return v22;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (NSData)verificationData
{
  return self->_verificationData;
}

- (void)setVerificationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationData, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end