@interface PKAccountWebServiceInstallmentAuthorizationRequest
+ (BOOL)supportsSecureCoding;
- (CNPostalAddress)shippingAddress;
- (Class)signatureResponseClass;
- (NSData)publicKeyHash;
- (NSDecimalNumber)authorizationAmount;
- (NSString)accountIdentifier;
- (NSString)bindToken;
- (NSString)installmentGroupIdentifier;
- (NSURL)baseURL;
- (PKAccountWebServiceInstallmentAuthorizationRequest)initWithCoder:(id)a3;
- (PKApplePayTrustHashResponse)hashResponse;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (id)endpointComponents;
- (id)manifestHashWithReferenceIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAuthorizationAmount:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBindToken:(id)a3;
- (void)setHashResponse:(id)a3;
- (void)setInstallmentGroupIdentifier:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setShippingAddress:(id)a3;
@end

@implementation PKAccountWebServiceInstallmentAuthorizationRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      int v28 = 138543618;
      v29 = v17;
      __int16 v30 = 2082;
      v31 = "appleAccountInformation";
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v28, 0x16u);
    }
    goto LABEL_25;
  }
  uint64_t v5 = [(PKAccountWebServiceInstallmentAuthorizationRequest *)self baseURL];
  if (!v5)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      int v28 = 138543618;
      v29 = v20;
      __int16 v30 = 2082;
      v31 = "baseURL";
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v28, 0x16u);
    }
    v6 = 0;
    goto LABEL_25;
  }
  v6 = v5;
  if (!self->_accountIdentifier)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    int v28 = 138543618;
    v29 = v23;
    __int16 v30 = 2082;
    v31 = "_accountIdentifier";
LABEL_23:
    _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v28, 0x16u);

    goto LABEL_24;
  }
  if (!self->_bindToken)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v24 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v24);
    int v28 = 138543618;
    v29 = v23;
    __int16 v30 = 2082;
    v31 = "_bindToken";
    goto LABEL_23;
  }
  if (!self->_authorizationAmount)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v25 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v25);
    int v28 = 138543618;
    v29 = v23;
    __int16 v30 = 2082;
    v31 = "_authorizationAmount";
    goto LABEL_23;
  }
  if (!self->_installmentGroupIdentifier)
  {
    v21 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v26);
      int v28 = 138543618;
      v29 = v23;
      __int16 v30 = 2082;
      v31 = "_installmentGroupIdentifier";
      goto LABEL_23;
    }
LABEL_24:

LABEL_25:
    v15 = 0;
    goto LABEL_26;
  }
  v7 = [(PKAccountWebServiceInstallmentAuthorizationRequest *)self endpointComponents];
  v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:self->_bindToken forKeyedSubscript:@"bindToken"];
  v10 = [(NSDecimalNumber *)self->_authorizationAmount stringValue];
  [v9 setObject:v10 forKeyedSubscript:@"authorizationAmount"];

  [v9 setObject:self->_installmentGroupIdentifier forKeyedSubscript:@"installmentGroupIdentifier"];
  shippingAddress = self->_shippingAddress;
  if (shippingAddress)
  {
    v12 = [(CNPostalAddress *)shippingAddress webServiceDictionaryRepresentation];
    [v9 setObject:v12 forKeyedSubscript:@"shippingAddress"];
  }
  v13 = [(NSData *)self->_publicKeyHash hexEncoding];
  [v9 setObject:v13 forKeyedSubscript:@"publicKeyHash"];

  v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
  [v8 setHTTPBody:v14];

  v15 = (void *)[v8 copy];
LABEL_26:

  return v15;
}

- (id)endpointComponents
{
  v5[4] = *MEMORY[0x1E4F143B8];
  accountIdentifier = self->_accountIdentifier;
  v5[0] = @"accounts";
  v5[1] = accountIdentifier;
  v5[2] = @"installments";
  v5[3] = @"authorize";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  return v3;
}

- (Class)signatureResponseClass
{
  return (Class)objc_opt_class();
}

- (id)manifestHashWithReferenceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(NSString *)self->_bindToken length]) {
    [v5 appendString:self->_bindToken];
  }
  authorizationAmount = self->_authorizationAmount;
  if (authorizationAmount)
  {
    v7 = [(NSDecimalNumber *)authorizationAmount stringValue];
    [v5 appendString:v7];
  }
  if ([(NSString *)self->_installmentGroupIdentifier length]) {
    [v5 appendString:self->_installmentGroupIdentifier];
  }
  if ([v4 length]) {
    [v5 appendString:v4];
  }
  v8 = [v5 dataUsingEncoding:4];
  id v9 = [v8 SHA256Hash];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountWebServiceInstallmentAuthorizationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountWebServiceInstallmentAuthorizationRequest;
  id v5 = [(PKOverlayableWebServiceRequest *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    [(PKAccountWebServiceInstallmentAuthorizationRequest *)v5 setBaseURL:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashResponse"];
    [(PKAccountWebServiceInstallmentAuthorizationRequest *)v5 setHashResponse:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bindToken"];
    bindToken = v5->_bindToken;
    v5->_bindToken = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationAmount"];
    authorizationAmount = v5->_authorizationAmount;
    v5->_authorizationAmount = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentGroupIdentifier"];
    installmentGroupIdentifier = v5->_installmentGroupIdentifier;
    v5->_installmentGroupIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingAddress"];
    shippingAddress = v5->_shippingAddress;
    v5->_shippingAddress = (CNPostalAddress *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountWebServiceInstallmentAuthorizationRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v7 encodeWithCoder:v4];
  id v5 = [(PKAccountWebServiceInstallmentAuthorizationRequest *)self baseURL];
  [v4 encodeObject:v5 forKey:@"baseURL"];

  v6 = [(PKAccountWebServiceInstallmentAuthorizationRequest *)self hashResponse];
  [v4 encodeObject:v6 forKey:@"hashResponse"];

  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_bindToken forKey:@"bindToken"];
  [v4 encodeObject:self->_authorizationAmount forKey:@"authorizationAmount"];
  [v4 encodeObject:self->_installmentGroupIdentifier forKey:@"installmentGroupIdentifier"];
  [v4 encodeObject:self->_shippingAddress forKey:@"shippingAddress"];
}

- (NSURL)baseURL
{
  return self->baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (PKApplePayTrustHashResponse)hashResponse
{
  return self->hashResponse;
}

- (void)setHashResponse:(id)a3
{
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)bindToken
{
  return self->_bindToken;
}

- (void)setBindToken:(id)a3
{
}

- (NSDecimalNumber)authorizationAmount
{
  return self->_authorizationAmount;
}

- (void)setAuthorizationAmount:(id)a3
{
}

- (NSString)installmentGroupIdentifier
{
  return self->_installmentGroupIdentifier;
}

- (void)setInstallmentGroupIdentifier:(id)a3
{
}

- (CNPostalAddress)shippingAddress
{
  return self->_shippingAddress;
}

- (void)setShippingAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_installmentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationAmount, 0);
  objc_storeStrong((id *)&self->_bindToken, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end