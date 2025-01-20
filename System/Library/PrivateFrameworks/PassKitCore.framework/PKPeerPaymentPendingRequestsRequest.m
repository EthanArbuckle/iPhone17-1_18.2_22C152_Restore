@interface PKPeerPaymentPendingRequestsRequest
- (NSArray)requestTokens;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setRequestTokens:(id)a3;
@end

@implementation PKPeerPaymentPendingRequestsRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v15 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    int v21 = 138543618;
    v22 = v17;
    __int16 v23 = 2082;
    v24 = "url";
LABEL_13:
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v21, 0x16u);

    goto LABEL_14;
  }
  if (!v7)
  {
    v15 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    int v21 = 138543618;
    v22 = v17;
    __int16 v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_13;
  }
  if (!self->_requestTokens)
  {
    v15 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v19);
      int v21 = 138543618;
      v22 = v17;
      __int16 v23 = 2082;
      v24 = "_requestTokens";
      goto LABEL_13;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v9 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B540 queryParameters:0 appleAccountInformation:v7];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v11 = v10;
  requestTokens = self->_requestTokens;
  if (requestTokens) {
    [v10 setObject:requestTokens forKey:@"requestTokens"];
  }
  v13 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
  [v9 setHTTPBody:v13];

  v14 = (void *)[v9 copy];
LABEL_15:

  return v14;
}

- (NSArray)requestTokens
{
  return self->_requestTokens;
}

- (void)setRequestTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end