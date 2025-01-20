@interface PKPeerPaymentPerformActionRequest
- (NSString)action;
- (NSString)paymentIdentifier;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setAction:(id)a3;
- (void)setPaymentIdentifier:(id)a3;
@end

@implementation PKPeerPaymentPerformActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "url";
LABEL_16:
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_17;
  }
  if (!v7)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_16;
  }
  paymentIdentifier = self->_paymentIdentifier;
  if (!paymentIdentifier)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v20 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "_paymentIdentifier";
    goto LABEL_16;
  }
  if (!self->_action)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      __int16 v26 = 2082;
      v27 = "_action";
      goto LABEL_16;
    }
LABEL_17:
    id v16 = 0;
    goto LABEL_18;
  }
  v23[0] = @"payment";
  v23[1] = paymentIdentifier;
  v23[2] = @"performAction";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v11 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

  [v11 setHTTPMethod:@"POST"];
  [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = v12;
  action = self->_action;
  if (action) {
    [v12 setObject:action forKey:@"action"];
  }
  v15 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v11 setHTTPBody:v15];

  id v16 = [v11 copy];
LABEL_18:

  return v16;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end