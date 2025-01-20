@interface PKAccountWebServiceApplePayTrustRequest
- (Class)responseClass;
- (PKAccountWebServiceApplePayTrustRequest)initWithApplePayTrustProtocol:(id)a3;
- (PKApplePayTrustSignature)signature;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (id)endpointComponents;
- (void)setSignature:(id)a3;
@end

@implementation PKAccountWebServiceApplePayTrustRequest

- (PKAccountWebServiceApplePayTrustRequest)initWithApplePayTrustProtocol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountWebServiceApplePayTrustRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_protocol, a3);
  }

  return v7;
}

- (Class)responseClass
{
  return (Class)[(PKAccountWebServiceApplePayTrustProtocol *)self->_protocol signatureResponseClass];
}

- (id)endpointComponents
{
  v2 = [(PKAccountWebServiceApplePayTrustProtocol *)self->_protocol endpointComponents];
  v3 = [v2 arrayByAddingObject:@"signature"];

  return v3;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKAccountWebServiceApplePayTrustProtocol *)self->_protocol baseURL];
  v6 = [(PKAccountWebServiceApplePayTrustRequest *)self endpointComponents];
  v7 = [(PKAccountWebServiceApplePayTrustProtocol *)self->_protocol hashResponse];
  v8 = [v7 referenceIdentifier];

  if (!v5)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    int v25 = 138543618;
    v26 = v20;
    __int16 v27 = 2082;
    v28 = "baseURL";
LABEL_18:
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v25, 0x16u);

    goto LABEL_19;
  }
  if (!v6)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    int v25 = 138543618;
    v26 = v20;
    __int16 v27 = 2082;
    v28 = "endpointComponents";
    goto LABEL_18;
  }
  if (!v4)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v22 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v22);
    int v25 = 138543618;
    v26 = v20;
    __int16 v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_18;
  }
  if (!v8)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v23);
      int v25 = 138543618;
      v26 = v20;
      __int16 v27 = 2082;
      v28 = "referenceIdentifier";
      goto LABEL_18;
    }
LABEL_19:

    v17 = 0;
    goto LABEL_20;
  }
  objc_super v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v6 queryParameters:0 appleAccountInformation:v4];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:v8 forKeyedSubscript:@"referenceIdentifier"];
  v11 = [(PKApplePayTrustSignature *)self->_signature signatureData];
  v12 = [v11 hexEncoding];
  [v10 setObject:v12 forKeyedSubscript:@"signatureData"];

  v13 = [(PKApplePayTrustSignature *)self->_signature paymentData];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 base64EncodedStringWithOptions:0];
    [v10 setObject:v15 forKeyedSubscript:@"paymentData"];
  }
  if (v10)
  {
    v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
    [v9 setHTTPBody:v16];
  }
  v17 = (void *)[v9 copy];

LABEL_20:
  return v17;
}

- (PKApplePayTrustSignature)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end