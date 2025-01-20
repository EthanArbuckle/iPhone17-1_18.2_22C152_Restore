@interface PKPeerPaymentPendingRequestPerformActionRequest
- (NSString)action;
- (NSString)requestToken;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setAction:(id)a3;
- (void)setRequestToken:(id)a3;
@end

@implementation PKPeerPaymentPendingRequestPerformActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v24 = v17;
    __int16 v25 = 2082;
    v26 = "url";
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
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v24 = v17;
    __int16 v25 = 2082;
    v26 = "appleAccountInformation";
    goto LABEL_16;
  }
  requestToken = self->_requestToken;
  if (!requestToken)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v19 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v24 = v17;
    __int16 v25 = 2082;
    v26 = "_requestToken";
    goto LABEL_16;
  }
  if (!self->_action)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      __int16 v25 = 2082;
      v26 = "_action";
      goto LABEL_16;
    }
LABEL_17:
    id v15 = 0;
    goto LABEL_18;
  }
  v22[0] = @"request";
  v22[1] = requestToken;
  v22[2] = @"performAction";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v11 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

  [v11 setHTTPMethod:@"POST"];
  [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = v12;
  if (v11)
  {
    [v12 setObject:self->_requestToken forKey:@"requestToken"];
    [v13 setObject:self->_action forKey:@"action"];
  }
  v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v11 setHTTPBody:v14];

  id v15 = [v11 copy];
LABEL_18:

  return v15;
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
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
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end