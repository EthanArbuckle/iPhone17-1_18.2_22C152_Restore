@interface PKApplePayTrustRegistrationRequest
- (PKApplePayTrustKey)applePayTrustKey;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setApplePayTrustKey:(id)a3;
@end

@implementation PKApplePayTrustRegistrationRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22 = @"devices";
  id v23 = a4;
  v24 = @"submitEnrollmentData";
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:&v22 count:3];
  v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v22, v23, v24, v25);

  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = [(PKApplePayTrustKey *)self->_applePayTrustKey signedEnrollmentData];
  v16 = [v15 hexEncoding];
  [v14 setObject:v16 forKeyedSubscript:@"signedEnrollmentData"];

  v17 = [(PKApplePayTrustKey *)self->_applePayTrustKey certificate];

  v18 = [v17 hexEncoding];
  [v14 setObject:v18 forKeyedSubscript:@"casdCertificate"];

  v19 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v14];
  [v13 setHTTPBody:v19];

  [v13 setHTTPMethod:@"POST"];
  v20 = (void *)[v13 copy];

  return v20;
}

- (PKApplePayTrustKey)applePayTrustKey
{
  return self->_applePayTrustKey;
}

- (void)setApplePayTrustKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end