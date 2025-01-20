@interface PKPeerPaymentAssociatedAccountActionRequest
- (NSString)featureIdentifier;
- (NSString)value;
- (PKPeerPaymentAssociatedAccountActionRequest)initWithAssociatedAccountIdentifier:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setFeatureIdentifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKPeerPaymentAssociatedAccountActionRequest

- (PKPeerPaymentAssociatedAccountActionRequest)initWithAssociatedAccountIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentAssociatedAccountActionRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_associatedAccountIdentifier, a3);
  }

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    __int16 v28 = 2082;
    v29 = "url";
LABEL_21:
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_22;
  }
  if (!v7)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v20 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    __int16 v28 = 2082;
    v29 = "appleAccountInformation";
    goto LABEL_21;
  }
  associatedAccountIdentifier = self->_associatedAccountIdentifier;
  if (!associatedAccountIdentifier)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v21 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    __int16 v28 = 2082;
    v29 = "_associatedAccountIdentifier";
    goto LABEL_21;
  }
  if (!self->_featureIdentifier)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v22 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    __int16 v28 = 2082;
    v29 = "_featureIdentifier";
    goto LABEL_21;
  }
  if (!self->_value)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      __int16 v28 = 2082;
      v29 = "_value";
      goto LABEL_21;
    }
LABEL_22:
    id v17 = 0;
    goto LABEL_23;
  }
  v25[0] = @"account";
  v25[1] = @"associatedAccountAction";
  v25[2] = associatedAccountIdentifier;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  v11 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

  [v11 setHTTPMethod:@"POST"];
  [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = v12;
  featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier) {
    [v12 setObject:featureIdentifier forKey:@"featureIdentifier"];
  }
  value = self->_value;
  if (value) {
    [v13 setObject:value forKey:@"value"];
  }
  v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v11 setHTTPBody:v16];

  id v17 = [v11 copy];
LABEL_23:

  return v17;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedAccountIdentifier, 0);
}

@end